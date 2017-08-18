require 'test_helper'

#class UsersControllerTest < ActionDispatch::IntegrationTest
class UsersControllerTest < ActionController::TestCase

  setup do
    @input_attributes = {
      name:                   "sam",
      password:               "private",
      password_confirmation:  "private"
    }
    @user = users(:one)
  end

  test "should get index" do
    #get users_url
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    #get new_user_url
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, params: { user: @input_attributes }
    end

    assert_redirected_to users_path
  end

  test "should show user" do
    #get user_url(@user)
    get :show, params: {id: @user}
    assert_response :success
  end

  test "should get edit" do
    #get edit_user_url(@user)
    get :edit, params: {id: @user}
    assert_response :success
  end

  test "should update user" do
    put :update, params: { id: @user.to_param, user: @input_attributes }
    assert_redirected_to users_path
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      #delete user_url(@user)
      delete :destroy, params: {id: @user}
    end

    assert_redirected_to users_url
  end
end
