require 'test_helper'

class PhotosControllerTest < ActionController::TestCase
  
  test "should get show" do
    get :show, :id => 1, :album_id => 1, :formart => 'html'
    assert_response :success
    
    assert assigns(:photo).valid? 
    assert_template layout: "layouts/application"

    assert_template :show
    assert_select 'h1', 'photo1'
  end

  test "should get show json data" do
    get :show, :id => 1, :album_id => 1, :format => 'json'
    assert_response :success
    
    body = JSON.parse(@response.body)
    assert_not_equal body, 'string'
  end

  test "should get new" do
    get :new, :album_id=>1
    assert_response :success
    assert_template :new
    assert_select 'h1', 'New photo'
  end

  test "should get edit" do
    get :edit,  :id => 1, :album_id => 1, :formart => 'html'
    assert_response :success

    assert_select 'h1', 'Edit photo'
    assert_select '#photo_name', 1
    assert_select '#photo_description', 1
  end

end
