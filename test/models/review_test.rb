require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  test "should not save without content" do
    review = Review.new(
      flat_id: 211,
      content: "",
      location: 3,
      cleanliness: 4,
      value: 5
    )
    assert_not review.save
  end

  test "should not save if location not within 1-5" do
    review = Review.new(
      flat_id: 211,
      content: "",
      location: 3,
      cleanliness: 4,
      value: 6
    )
    assert_not review.save
  end

  test "should not save if value not integer" do
    review = Review.new(
      flat_id: 211,
      content: "",
      location: 3,
      cleanliness: 4,
      value: 6.5
    )
    assert_not review.save
  end
end
