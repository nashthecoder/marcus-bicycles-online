require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user =users(:one)
    sign_in @user
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
    assert_select "p", text: /No description available/
  end
end
