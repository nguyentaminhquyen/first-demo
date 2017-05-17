require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get loginsignup" do
    get user_loginsignup_url
    assert_response :success
  end

  test "should get forgot_password" do
    get user_forgot_password_url
    assert_response :success
  end

  test "should get logout" do
    get user_logout_url
    assert_response :success
  end

end
