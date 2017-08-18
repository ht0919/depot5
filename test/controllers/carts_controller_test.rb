require 'test_helper'

#class CartsControllerTest < ActionDispatch::IntegrationTest
class CartsControllerTest < ActionController::TestCase

  setup do
    @cart = carts(:one)
  end

  test "should get index" do
    #get carts_url
    get :index
    assert_response :success
    assert_not_nil assigns(:carts)
  end

  test "should get new" do
    #get new_cart_url
    get :new
    assert_response :success
  end

  test "should create cart" do
    assert_difference('Cart.count') do
      #post carts_url, params: { cart: {  } }
      post :create, params: {cart: {  }}
    end

    assert_redirected_to cart_url(Cart.last)
  end

  test "should show cart" do
    #get cart_url(@cart)
    get :show, params: {id: @cart}
    assert_response :success
  end

  test "should get edit" do
    #get edit_cart_url(@cart)
    get :edit, params: {id: @cart}
    assert_response :success
  end

  test "should update cart" do
    #patch cart_url(@cart), params: { cart: {  } }
    #assert_redirected_to cart_url(@cart)
    put :update, params: { id: @cart.to_param, cart: @cart.attributes }
    assert_redirected_to cart_path(assigns(:cart))
  end

  test "should destroy cart" do
    assert_difference('Cart.count', -1) do
      #delete :destroy, {id: @cart.to_param}, {cart_id: @cart.id}
      session[:cart_id] = @cart.id
      delete :destroy, params: { id: @cart.to_param }
    end

    assert_redirected_to store_path
  end

end
