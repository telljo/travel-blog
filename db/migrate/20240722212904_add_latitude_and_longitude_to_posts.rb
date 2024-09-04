# frozen_string_literal: true

class AddLatitudeAndLongitudeToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :latitude, :float
    add_column :posts, :longitude, :float
    add_column :posts, :address, :string

    add_index :posts, :latitude
    add_index :posts, :longitude
  end
end
