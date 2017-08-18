require 'test_helper'

#class OrdersControllerTest < ActionDispatch::IntegrationTest
class OrdersControllerTest < ActionController::TestCase

  setup do
    @order = orders(:one)
  end

  test "should get index" do
    #get orders_url
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "requires item in cart" do
    #get new_order_url
    get :new
    assert_redirected_to store_path
    assert_equal 'カートは空です', flash[:notice]
  end

  test "should get new" do
    cart = Cart.create
    LineItem.create(cart: cart, product: products(:ruby))

    #get :new, {}, {cart_id: cart.id}
    get :new, params: {id: {}}, session: {cart_id: cart.id}
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      #post orders_url, params: { order: { address: @order.address, email: @order.email, name: @order.name, pay_type: @order.pay_type } }
      post :create, params: {order: { address: @order.address, email: @order.email, name: @order.name, pay_type: @order.pay_type }}
    end

    #assert_redirected_to order_url(Order.last)
    assert_redirected_to store_path
  end

  test "should show order" do
    #get order_url(@order)
    get :show, params: {id: @order}
    assert_response :success
  end

  test "should get edit" do
    #get edit_order_url(@order)
    get :edit, params: {id: @order}
    assert_response :success
  end

  test "should update order" do
    #patch order_url(@order), params: { order: { address: @order.address, email: @order.email, name: @order.name, pay_type: @order.pay_type } }
    #assert_redirected_to order_url(@order)
    patch :update, params: {id: @order, order: { address: @order.address, email: @order.email, name: @order.name, pay_type: @order.pay_type }}
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      #delete order_url(@order)
      delete :destroy, params: {id: @order}
    end

    assert_redirected_to orders_url
  end
end
