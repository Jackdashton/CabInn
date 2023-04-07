class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def bookings
    @bookings = Booking.all
    @user = current_user
    @requested_bookings = @bookings.select do |booking|
      booking.user == @user && booking.status == false
    end
    @reserved_bookings = @user.bookings.where(status: true)
    @flats = @user.flats
  end
end
