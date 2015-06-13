require 'test_helper'

class HomeapisControllerTest < ActionController::TestCase
  setup do
    @homeapi = homeapis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:homeapis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create homeapi" do
    assert_difference('Homeapi.count') do
      post :create, homeapi: {  }
    end

    assert_redirected_to homeapi_path(assigns(:homeapi))
  end

  test "should show homeapi" do
    get :show, id: @homeapi
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @homeapi
    assert_response :success
  end

  test "should update homeapi" do
    patch :update, id: @homeapi, homeapi: {  }
    assert_redirected_to homeapi_path(assigns(:homeapi))
  end

  test "should destroy homeapi" do
    assert_difference('Homeapi.count', -1) do
      delete :destroy, id: @homeapi
    end

    assert_redirected_to homeapis_path
  end
end
