# frozen_string_literal: true

json.extract! trip, :id, :name, :user_id, :created_at, :updated_at
json.url trip_url(trip, format: :json)
