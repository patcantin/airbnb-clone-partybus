class BusController < ApplicationController
  before_action :set_bus, only: [:show, :destroy]

  def index
    @buses = Bus.all
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end

  private

  def set_bus
    @bus = Bus.find(params[:id])
  end

  def bus_params
    params.require(:bus).permit(:name, :capacity, :description, :price)
  end
end
