class BookingController < ApplicationController
  # before_action :set_booking, only: [:show, :destroy]

  def new
  end

  def create
  end

  private

  # def set_booking
  #   @booking = Booking.find(params[:id])
  # end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
