require 'test_helper'

class CheckoutStatusesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:checkout_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create checkout_status" do
    assert_difference('CheckoutStatus.count') do
      post :create, :checkout_status => { }
    end

    assert_redirected_to checkout_status_path(assigns(:checkout_status))
  end

  test "should show checkout_status" do
    get :show, :id => checkout_statuses(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => checkout_statuses(:one).to_param
    assert_response :success
  end

  test "should update checkout_status" do
    put :update, :id => checkout_statuses(:one).to_param, :checkout_status => { }
    assert_redirected_to checkout_status_path(assigns(:checkout_status))
  end

  test "should destroy checkout_status" do
    assert_difference('CheckoutStatus.count', -1) do
      delete :destroy, :id => checkout_statuses(:one).to_param
    end

    assert_redirected_to checkout_statuses_path
  end
end
