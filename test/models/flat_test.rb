require "test_helper"

class FlatTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "should not save flat without title" do
    flat = Flat.new
    assert_not flat.save
  end
end
