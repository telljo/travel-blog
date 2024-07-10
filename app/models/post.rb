# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :trip
  has_one :user, through: :trip

  validates :title, presence: true
  validates :body, presence: true

  has_rich_text :body
  has_one_attached :image, dependent: :destroy
  validate :image_type

  broadcasts_refreshes_to :trip

  def image_as_thumbnail
    return unless image.content_type.in?(%w[image/jpeg image/png])

    image.variant(resize_to_limit: [300, 300]).processed
  end

  def image_type
    return unless image.attached?

    errors.add(:image, 'is missing!') if image.attached? == false
    return if image.content_type.in?(%('image/jpeg image/png'))

    errors.add(:image, 'Image must be a jpeg or png.')
  end
end
