# frozen_string_literal: true

class GeolocationsController < ApplicationController
  def search
    @geolocations = Geocoder.search(params[:geolocations][:query])
  end

  def find_location
    latitude = params[:latitude]
    longitude = params[:longitude]

    @location = Geocoder.search([latitude, longitude]).first

    render json: @location
  end
end
