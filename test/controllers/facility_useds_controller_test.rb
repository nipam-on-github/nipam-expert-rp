require 'test_helper'

class FacilityUsedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @facility_used = facility_useds(:one)
  end

  test "should get index" do
    get facility_useds_url
    assert_response :success
  end

  test "should get new" do
    get new_facility_used_url
    assert_response :success
  end

  test "should create facility_used" do
    assert_difference('FacilityUsed.count') do
      post facility_useds_url, params: { facility_used: { facility: @facility_used.facility, visit_id: @facility_used.visit_id } }
    end

    assert_redirected_to facility_used_url(FacilityUsed.last)
  end

  test "should show facility_used" do
    get facility_used_url(@facility_used)
    assert_response :success
  end

  test "should get edit" do
    get edit_facility_used_url(@facility_used)
    assert_response :success
  end

  test "should update facility_used" do
    patch facility_used_url(@facility_used), params: { facility_used: { facility: @facility_used.facility, visit_id: @facility_used.visit_id } }
    assert_redirected_to facility_used_url(@facility_used)
  end

  test "should destroy facility_used" do
    assert_difference('FacilityUsed.count', -1) do
      delete facility_used_url(@facility_used)
    end

    assert_redirected_to facility_useds_url
  end
end
