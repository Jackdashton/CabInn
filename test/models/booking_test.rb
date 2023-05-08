require "test_helper"

class BookingTest < ActiveSupport::TestCase
  test "should not save without arrival date" do
    booking = Booking.new(
      arrival: "Wed, 24 May 2023",
      departure: ""
    )
    assert_not booking.save
  end
end
