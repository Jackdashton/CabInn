require "application_system_test_case"

class FlatsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit flats_url

    assert_selector "a", text: "Cabin"
  end
end
