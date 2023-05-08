require "test_helper"

class FlatTest < ActiveSupport::TestCase
  test "should not save flat without name" do
    flat = Flat.new
    assert_not flat.save
  end

  test "has a description" do
    flat = Flat.new(
      name: "Cabin",
      address: "30 Drachenseestrasse",
      description: "",
      guest_num: 5,
      price_per_night: 45
    )
    assert_not flat.save
  end

  test "has a price per night between 1 and 20000 euros" do
    flat = Flat.new(
      name: "Cabin",
      address: "30 Drachenseestrasse",
      description: "Amazing",
      guest_num: 5,
      price_per_night: 45
    )
    assert_not flat.save
  end
end
