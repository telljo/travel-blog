# frozen_string_literal: true

class CreateTripPosts < ActiveRecord::Migration[7.1]
  def change
    create_table :trip_posts do |t|
      t.string :title
      t.text :body
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
