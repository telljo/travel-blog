# frozen_string_literal: true

class Trip < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
end
