class ReviewsController < ApplicationController
  before_action :set_review, only: [:destroy]

  def new
    @review = Review.new
    @bus = Bus.find(params[:bus_id])
  end

  def create
    @review = Review.new(review_params)
    @bus = Bus.find(params[:bus_id])
    @review.bus = @bus
    @review.user = current_user
    @review.save!
    redirect_to bus_path(@bus)
  end

  def destroy
    @booking.destroy
    redirect_to bus_path
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:description, :note)
  end

end
