require "application_system_test_case"

class FacilityUsedsTest < ApplicationSystemTestCase
  setup do
    @facility_used = facility_useds(:one)
  end

  test "visiting the index" do
    visit facility_useds_url
    assert_selector "h1", text: "Facility Useds"
  end

  test "creating a Facility used" do
    visit facility_useds_url
    click_on "New Facility Used"

    fill_in "Facility", with: @facility_used.facility
    fill_in "Visit", with: @facility_used.visit_id
    click_on "Create Facility used"

    assert_text "Facility used was successfully created"
    click_on "Back"
  end

  test "updating a Facility used" do
    visit facility_useds_url
    click_on "Edit", match: :first

    fill_in "Facility", with: @facility_used.facility
    fill_in "Visit", with: @facility_used.visit_id
    click_on "Update Facility used"

    assert_text "Facility used was successfully updated"
    click_on "Back"
  end

  test "destroying a Facility used" do
    visit facility_useds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Facility used was successfully destroyed"
  end
end
