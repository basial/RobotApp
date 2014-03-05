require 'test_helper'

class MovesControllerTest < ActionController::TestCase
  test "should get lock" do
    get :lock
    assert_response :success
  end

  test "should get forward" do
    get :forward
    assert_response :success
  end

  test "should get backward" do
    get :backward
    assert_response :success
  end

  test "should get slow_forward" do
    get :slow_forward
    assert_response :success
  end

  test "should get fast_forward" do
    get :fast_forward
    assert_response :success
  end

  test "should get left" do
    get :left
    assert_response :success
  end

  test "should get right" do
    get :right
    assert_response :success
  end

  test "should get run" do
    get :run
    assert_response :success
  end

  test "should get attack" do
    get :attack
    assert_response :success
  end

end
