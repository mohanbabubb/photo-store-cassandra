require 'test_helper'

class ItemdetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @itemdetail = itemdetails(:one)
  end

  test "should get index" do
    get itemdetails_url
    assert_response :success
  end

  test "should get new" do
    get new_itemdetail_url
    assert_response :success
  end

  test "should create itemdetail" do
    assert_difference('Itemdetail.count') do
      post itemdetails_url, params: { itemdetail: { itemattribute: @itemdetail.itemattribute, itemvalue: @itemdetail.itemvalue } }
    end

    assert_redirected_to itemdetail_url(Itemdetail.last)
  end

  test "should show itemdetail" do
    get itemdetail_url(@itemdetail)
    assert_response :success
  end

  test "should get edit" do
    get edit_itemdetail_url(@itemdetail)
    assert_response :success
  end

  test "should update itemdetail" do
    patch itemdetail_url(@itemdetail), params: { itemdetail: { itemattribute: @itemdetail.itemattribute, itemvalue: @itemdetail.itemvalue } }
    assert_redirected_to itemdetail_url(@itemdetail)
  end

  test "should destroy itemdetail" do
    assert_difference('Itemdetail.count', -1) do
      delete itemdetail_url(@itemdetail)
    end

    assert_redirected_to itemdetails_url
  end
end
