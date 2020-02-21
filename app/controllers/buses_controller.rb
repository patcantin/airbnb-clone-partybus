class BusesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_bus, only: [:show, :edit, :update, :destroy]

  def index
    @buses = Bus.all
  end

  def show
    @bookings = Booking.all
  end

  def new
    @bus = Bus.new
  end

  def create
    @bus = Bus.new(bus_params)
    @bus.user = current_user
    if @bus.save!
      # we look for options added for bus created bus; we link all options to create the bus and delete first empty string.
      params[:bus][:option_ids][1..-1].each do |id|
        BusOption.create(bus_id: @bus.id, option_id: id)
      end
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @bus.update(name: params[:bus][:name], capacity: params[:bus][:capacity], description: params[:bus][:description], price: params[:bus][:price], photo: params[:bus][:photo])
    redirect_to dashboard_path
  end

  def destroy
    @bus.destroy
    redirect_to buses_path
  end

  private

  def set_bus
    @bus = Bus.find(params[:id])
  end

  def bus_params
    params.require(:bus).permit(:name, :capacity, :description, :price, :photo)
  end
end
