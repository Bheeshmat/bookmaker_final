require 'test_helper'

class ChaptersControllerTest < ActionController::TestCase
  test "should get title:string" do
    get :title:string
    assert_response :success
  end

  test "should get notes:text" do
    get :notes:text
    assert_response :success
  end

  test "should get Book:references" do
    get :Book:references
    assert_response :success
  end

end
