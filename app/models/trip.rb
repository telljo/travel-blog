# frozen_string_literal: true

class Trip < ApplicationRecord
  belongs_to :user
  has_many :trip_posts, dependent: :destroy
end
