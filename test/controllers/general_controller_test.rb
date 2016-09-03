require 'test_helper'

class GeneralControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get import_data" do
    get :import_data
    assert_response :success
  end

  test "should get clean_data" do
    get :clean_data
    assert_response :success
  end

end
