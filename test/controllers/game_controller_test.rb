require "test_helper"

class GameControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get game_home_url
    assert_response :success
  end

  test "should get throw" do
    get game_throw_url
    assert_response :success
  end
end
