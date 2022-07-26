require 'test_helper'

class PublicpostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get publicposts_index_url
    assert_response :success
  end

end
