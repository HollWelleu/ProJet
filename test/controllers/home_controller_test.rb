require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get home_login_url
    assert_response :success
  end

  test "should get private" do
    get home_private_url
    assert_response :success
  end
end
