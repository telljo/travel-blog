# frozen_string_literal: true

class Trip < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy

  validates :name, presence: true
  validates :body, presence: true
  has_rich_text :body

  broadcasts_refreshes
end
