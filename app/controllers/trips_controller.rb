# frozen_string_literal: true

class TripsController < ApplicationController
  before_action :set_trip, only: %i[show edit update destroy]

  # GET /trips or /trips.json
  def index
    @trips = Trip.all
  end

  # GET /trips/1 or /trips/1.json
  def show; end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit; end

  # POST /trips or /trips.json
  def create
    @trip = Trip.new(trip_params.merge(user: current_user))

    respond_to do |format|
      if @trip.save
        format.html do
          flash[:notice] = 'Trip was successfully created.'
          redirect_to trips_url
        end
        format.turbo_stream
      else
        format.html { render trips_url, status: :unprocessable_entity }
        format.turbo_stream { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1 or /trips/1.json
  def update
    if @trip.update(trip_params)
      flash[:notice] = 'Trip was successfully updated.'
      redirect_to trip_url(@trip)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /trips/1 or /trips/1.json
  def destroy
    @trip.destroy!

    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_trip
    @trip = Trip.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def trip_params
    params.require(:trip).permit(:name, :description)
  end
end
