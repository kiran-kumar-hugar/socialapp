require 'test_helper'

class RakeControllerTest < ActionDispatch::IntegrationTest
  test "should get routes" do
    get rake_routes_url
    assert_response :success
  end

end
