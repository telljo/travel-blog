# frozen_string_literal: true

class SearchLocationController < ApplicationController
  def create
    latitude = params[:latitude]
    longitude = params[:longitude]

    @location = Geocoder.search([latitude, longitude]).first

    render json: @location
  end
end
