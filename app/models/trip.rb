# frozen_string_literal: true

class Trip < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy
end
