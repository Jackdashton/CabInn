class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def bookings
    @bookings = Booking.all
    @user = current_user
    # request bookings belong to specific user and are not tbc (false)
    @requested_bookings = @bookings.select do |booking|
      booking.user == @user && booking.status == false
    end
    # reserved bookings are true
    @reserved_bookings = @user.bookings.where(status: true)
    @flats = @user.flats
  end
end
