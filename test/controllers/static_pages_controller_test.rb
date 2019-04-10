require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get about_me" do
    get static_pages_about_me_url
    assert_response :success
  end

  test "should get yoyo_maintenance" do
    get static_pages_yoyo_maintenance_url
    assert_response :success
  end

  test "should get tricks" do
    get static_pages_tricks_url
    assert_response :success
  end

end
