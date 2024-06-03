# frozen_string_literal: true

class TripPostsController < ApplicationController
  before_action :set_trip_post, only: %i[show edit update destroy]

  # GET /trip_posts
  def index
    @trip_posts = TripPost.all
  end

  # GET /trip_posts/1
  def show; end

  # GET /trip_posts/1/edit
  def edit; end

  def new
    @trip = Trip.find(params[:trip_id])
    @trip_post = @trip.trip_posts.new
  end

  # POST /trip_posts
  def create
    @trip = Trip.find(trip_post_params[:trip_id])
    @trip_post = @trip.trip_posts.build(trip_post_params)

    if @trip_post.save
      respond_to do |format|
        format.html { redirect_to trip_url(@trip), notice: 'Post was successfully created.' }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trip_posts/1
  def update
    if @trip_post.update(trip_post_params)
      respond_to do |format|
        format.html { redirect_to trip_url(@trip), notice: 'Post was successfully updated.' }
        format.turbo_stream { flash.now[:notice] = 'Post was successfully updated.' }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @trip_post.destroy

    respond_to do |format|
      format.html { redirect_to trip_url(@trip), notice: 'Post was successfully deleted.' }
      format.turbo_stream { flash.now[:notice] = 'Post was successfully deleted.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_trip_post
    @trip_post = TripPost.find(params[:id])
    @trip = @trip_post.trip
  end

  # Only allow a list of trusted parameters through.
  def trip_post_params
    params.require(:trip_post).permit(:title, :body, :trip_id, :image_file)
  end
end
