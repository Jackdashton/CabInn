class BookingsController < ApplicationController
  def new
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new
  end

  def create
  end
end
