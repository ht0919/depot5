require 'test_helper'

#class LineItemsControllerTest < ActionDispatch::IntegrationTest
class LineItemsControllerTest < ActionController::TestCase
  setup do
    @line_item = line_items(:one)
  end

  test "should get index" do
    #get line_items_url
    get :index
    assert_response :success
    assert_not_nil assigns(:line_items)
  end

  test "should get new" do
    #get new_line_item_url
    get :new
    assert_response :success
  end

  test "should create line_item" do
    assert_difference('LineItem.count') do
      #post line_items_url, params: {product_id: products(:ruby).id
      post :create, params: {product_id: products(:ruby).id}
    end
    assert_redirected_to store_path
  end

  test "should create line_item via ajax" do
    assert_difference('LineItem.count') do
      #xhr :post, :create, params: {product_id: products(:ruby).id}
      post :create, params: { product_id: products(:ruby).id }, xhr: true
    end

    assert_response :success
    assert_select_jquery :html, '#cart' do
      assert_select 'tr#current_item td', /Programming Ruby 1.9/
    end
  end

  test "should show line_item" do
    #get line_item_url(@line_item)
    get :show, params: {id: @line_item}
    assert_response :success
  end

  test "should get edit" do
    #get edit_line_item_url(@line_item)
    get :edit, params: {id: @line_item}
    assert_response :success
  end

  test "should update line_item" do
    #patch line_item_url(@line_item), params: { line_item: { cart_id: @line_item.cart_id, product_id: @line_item.product_id } }
    put :update, params: { id: @line_item.to_param, line_item: @line_item.attributes }
    #assert_redirected_to line_item_url(@line_item)
    assert_response :success
  end

  test "should destroy line_item" do
    assert_difference('LineItem.count', -1) do
      #delete line_item_url(@line_item)
      delete :destroy, params: {id: @line_item}
    end

    assert_redirected_to line_items_url
  end
end
