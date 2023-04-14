class BookingsController < ApplicationController
  before_action :set_flat, only: %i[new create update]
  before_action :set_booking, only: %i[update destroy]

  # We need to create a booking and render a form(new)
  # We need to update the status - accepted or not (true/false)
  # We need to be able to delete a booking.
  # new create and update need to have a flat id, delete does not.

  def new
    @booking = Booking.new
    authorize(@booking)
  end

  def create
    # For instannce of booking, we need an instance of user and flat.
    @booking = Booking.new(booking_params)
    @booking.flat = @flat
    @booking.user = current_user
    authorize(@booking)
    # Booking status false when initialised.
    @booking.status = false
    # if the booking can be saved with validations, then redirect otherwise re-render form.
    if @booking.save!
      redirect_to flats_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @booking.status = true
    @booking.save
    redirect_to flats_path
  end

  def destroy
    @booking.destroy
    redirect_to flats_path
  end

  private

  def booking_params
    params.require(:booking).permit(:flat_id, :arrival, :departure)
  end

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
