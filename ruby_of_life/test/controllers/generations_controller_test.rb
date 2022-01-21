require "test_helper"

class GenerationsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get generations_show_url
    assert_response :success
  end
end
