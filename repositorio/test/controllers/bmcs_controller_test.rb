require 'test_helper'

class BmcsControllerTest < ActionController::TestCase
  setup do
    @bmc = bmcs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bmcs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bmc" do
    assert_difference('Bmc.count') do
      post :create, bmc: { cliente: @bmc.cliente, problema: @bmc.problema, propuesta: @bmc.propuesta, proyect_id: @bmc.proyect_id }
    end

    assert_redirected_to bmc_path(assigns(:bmc))
  end

  test "should show bmc" do
    get :show, id: @bmc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bmc
    assert_response :success
  end

  test "should update bmc" do
    patch :update, id: @bmc, bmc: { cliente: @bmc.cliente, problema: @bmc.problema, propuesta: @bmc.propuesta, proyect_id: @bmc.proyect_id }
    assert_redirected_to bmc_path(assigns(:bmc))
  end

  test "should destroy bmc" do
    assert_difference('Bmc.count', -1) do
      delete :destroy, id: @bmc
    end

    assert_redirected_to bmcs_path
  end
end
