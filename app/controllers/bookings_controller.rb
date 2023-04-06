class BookingsController < ApplicationController
  before_action :set_flat, only: [:new, :create, :update]
  before_action :set_booking, only: [:update, :destroy]

  def new
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new
    @booking.flat = @flat
    # Need reference to current flat to be used in the view page.
    @user = current_user
    # booking status is false
    @booking.status = false
    if @booking.save!
      redirect_to bookings_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flat_id)
  end

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
