# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :set_trip, only: %i[show edit update destroy]

  # GET /posts
  def index; end

  # GET /posts/1
  def show; end

  # GET /posts/1/edit
  def edit; end

  def new
    @trip = Trip.find(params[:trip_id])
    @post = @trip.posts.new
  end

  # POST /posts
  def create
    @trip = Trip.find(params[:trip_id])
    @post = Post.new(post_params)
    @post.trip = @trip

    respond_to do |format|
      if @post.save
        format.html do
          flash[:notice] = 'Post was successfully created.'
          redirect_to @trip
        end
        format.turbo_stream
      else
        format.html { render @trip, status: :unprocessable_entity }
        format.turbo_stream { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      flash[:notice] = 'Post was successfully updated.'
      redirect_to @trip
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to trip_url(@trip), notice: 'Post was successfully deleted.' }
      format.turbo_stream { flash.now[:notice] = 'Post was successfully deleted.' }
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
    @trip = @post.trip
  end

  def set_trip
    @trip = @post.trip
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body, :trip_id, :image_file)
  end
end
