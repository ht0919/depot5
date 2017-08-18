require 'test_helper'

#class AdminControllerTest < ActionDispatch::IntegrationTest
class AdminControllerTest < ActionController::TestCase

  test "should get index" do
    #get admin_index_url
    get :index
    assert_response :success
  end

end
