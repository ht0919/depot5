require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @input_attributes = {
      name:                   "sam",
      password:               "private",
      password_confirmation:  "private"
    }
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

=begin
  test "should create user" do
    assert_difference('User.count') do
      #post users_url, params: { user: { name: @user.name, password_digest: @user.password_digest } }
      #post :create, user: @input_attributes
      post users_url, params: { user: @input_attributes }
    end

    #assert_redirected_to user_url(User.last)
    assert_redirected_to users_path
  end
=end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    #patch user_url(@user), params: { user: { name: @user.name, password_digest: @user.password_digest } }
    #put :update, id: @user.to_param, user: @input_attributes
    put user_url(@user), params: {id: @user.to_param, user: @input_attributes}
    #assert_redirected_to user_url(@user)
    assert_redirected_to user_path
end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
