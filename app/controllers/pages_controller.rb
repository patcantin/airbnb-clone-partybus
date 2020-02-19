class PagesController < ApplicationController
  def dashboard
    @bookings = current_user.bookings
    @buses = current_user.buses
  end

  def search
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") && return
    else
      @parameter = params[:search].downcase
      @results = Bus.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
    end
  end
end
