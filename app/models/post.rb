# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :trip

  validates :title, presence: true
  validates :body, presence: true

  has_one_attached :image
end
