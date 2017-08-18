require 'test_helper'

#class ProductsControllerTest < ActionDispatch::IntegrationTest
class ProductsControllerTest < ActionController::TestCase
  setup do
    #@product = products(:one)
    @product = products(:one)
    @update = {
      title:        'Lorem Ipsum',
      description:  'Wibbles are fun!',
      image_url:    'lorem.jpg',
      price:        19.95
    }
  end

  test "should get index" do
    #get products_url
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    #get new_product_url
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      #post products_url, params: { product: { description: @product.description, image_url: @product.image_url, price: @product.price, title: @product.title } }
      #post products_url, params: { product: @update }
      post :create, params: {product: @update}
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    #get product_url(@product)
    get :show, params: {id: @product}
    assert_response :success
  end

  test "should get edit" do
    #get edit_product_url(@product)
    get :edit, params: {id: @product}
    assert_response :success
  end

  test "should update product" do
    #patch product_url(@product), params: { product: { description: @product.description, image_url: @product.image_url, price: @product.price, title: @product.title } }
    #patch product_url(@product), params: { product: @update }
    #assert_redirected_to product_url(@product)
    put :update, params: {id: @product.to_param, product: @update}
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      #delete product_url(@product)
      delete :destroy, params: {id: @product}
    end

    assert_redirected_to products_url
  end
end
