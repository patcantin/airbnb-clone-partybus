class PagesController < ApplicationController
  def dashboard
    @bookings = current_user.bookings
    @buses = current_user.buses
  end
end
