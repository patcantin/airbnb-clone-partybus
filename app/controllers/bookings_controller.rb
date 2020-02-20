class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]

  def new
    @bookings = Booking.all
    @booking = Booking.new
    @bus = Bus.find(params[:bus_id])
  end

  def show
  end

  def create
    @booking = Booking.new(booking_params)
    @bus = Bus.find(params[:bus_id])
    @booking.bus = @bus
    @booking.user = current_user
    if @booking.valid?
      @booking.save!
      flash[:success] = "Comment successfully created!"
      redirect_to dashboard_path
    else
      flash[:warning] = "End date must be greater than Start date"
      render :new
    end
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
