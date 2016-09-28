require 'test_helper'

class PvsControllerTest < ActionController::TestCase
  setup do
    @pv = pvs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pvs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pv" do
    assert_difference('Pv.count') do
      post :create, pv: { eliminadores: @pv.eliminadores, frustaciones: @pv.frustaciones, ganancias: @pv.ganancias, generadores: @pv.generadores, productos: @pv.productos, proyect_id: @pv.proyect_id, tareas: @pv.tareas }
    end

    assert_redirected_to pv_path(assigns(:pv))
  end

  test "should show pv" do
    get :show, id: @pv
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pv
    assert_response :success
  end

  test "should update pv" do
    patch :update, id: @pv, pv: { eliminadores: @pv.eliminadores, frustaciones: @pv.frustaciones, ganancias: @pv.ganancias, generadores: @pv.generadores, productos: @pv.productos, proyect_id: @pv.proyect_id, tareas: @pv.tareas }
    assert_redirected_to pv_path(assigns(:pv))
  end

  test "should destroy pv" do
    assert_difference('Pv.count', -1) do
      delete :destroy, id: @pv
    end

    assert_redirected_to pvs_path
  end
end
