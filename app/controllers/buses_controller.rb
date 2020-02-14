class BusesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_bus, only: [:show, :destroy]

  def index
    @buses = Bus.all
  end

  def show
  end

  def new
    @bus = Bus.new
  end

  def create
    @bus = Bus.new(bus_params)
    @bus.user = current_user
    if @bus.save!
      redirect_to dashboard_path
    else
      render :new
    end
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
    params.require(:bus).permit(:name, :capacity, :description, :price)
  end
end
