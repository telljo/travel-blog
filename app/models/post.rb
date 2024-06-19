# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :trip
  has_one :user, through: :trip

  validates :title, presence: true
  validates :body, presence: true

  has_one_attached :image

  broadcasts_refreshes_to :trip
end
