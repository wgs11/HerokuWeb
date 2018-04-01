require 'test_helper'

class P5sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @p5 = p5s(:one)
  end

  test "should get index" do
    get p5s_url
    assert_response :success
  end

  test "should get new" do
    get new_p5_url
    assert_response :success
  end

  test "should create p5" do
    assert_difference('P5.count') do
      post p5s_url, params: { p5: {  } }
    end

    assert_redirected_to p5_url(P5.last)
  end

  test "should show p5" do
    get p5_url(@p5)
    assert_response :success
  end

  test "should get edit" do
    get edit_p5_url(@p5)
    assert_response :success
  end

  test "should update p5" do
    patch p5_url(@p5), params: { p5: {  } }
    assert_redirected_to p5_url(@p5)
  end

  test "should destroy p5" do
    assert_difference('P5.count', -1) do
      delete p5_url(@p5)
    end

    assert_redirected_to p5s_url
  end
end
