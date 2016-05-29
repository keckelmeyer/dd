require 'test_helper'

class PlatesControllerTest < ActionController::TestCase
  setup do
    @plate = plates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plate" do
    assert_difference('Plate.count') do
      post :create, plate: { general: @plate.general, general: @plate.general, merging: @plate.merging, merging: @plate.merging, parking: @plate.parking, parking: @plate.parking, plate: @plate.plate, speed: @plate.speed, speed: @plate.speed, state: @plate.state, turning: @plate.turning, turning: @plate.turning }
    end

    assert_redirected_to plate_path(assigns(:plate))
  end

  test "should show plate" do
    get :show, id: @plate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plate
    assert_response :success
  end

  test "should update plate" do
    patch :update, id: @plate, plate: { general: @plate.general, general: @plate.general, merging: @plate.merging, merging: @plate.merging, parking: @plate.parking, parking: @plate.parking, plate: @plate.plate, speed: @plate.speed, speed: @plate.speed, state: @plate.state, turning: @plate.turning, turning: @plate.turning }
    assert_redirected_to plate_path(assigns(:plate))
  end

  test "should destroy plate" do
    assert_difference('Plate.count', -1) do
      delete :destroy, id: @plate
    end

    assert_redirected_to plates_path
  end
end
