require "test_helper"

class SharingControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get sharing_create_url
    assert_response :success
  end
end
