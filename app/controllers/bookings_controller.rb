class BookingsController < ApplicationController
  before_action :set_booking, only: [:destroy]

  def new
    @booking = Booking.new
    @bus = Bus.find(params[:bus_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @bus = Bus.find(params[:bus_id])
    @booking.bus = @bus
    @booking.user = current_user
    @booking.save!
    redirect_to dashboard_path
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
