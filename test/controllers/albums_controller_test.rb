require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
    assert_template layout: "layouts/application"

    assert_select 'tr', 4
    assert_select 'h1', 'Albums'
  end

  test "should get new" do
    get :new
    assert_response :success

    assert_select 'h1', 'New album'
    assert_select '#album_name', 1
    assert_select '#album_position', 1
  end

  test "should post create" do
    assert_difference('Album.count') do
      post :create, album: {name: "album", position:3}
    end

    assert_redirected_to album_path(assigns(:album))
  end


  test "should get edit" do
    get :edit, {'id' => '1'}

    assert_response :success
    assert_not_nil assigns(:album)
  end

  test "shoudl get show" do
    get :show, {'id' => '1'}

    assert_response :success
    assert_not_nil assigns(:album)

    assert_select 'h1', 'MyString'

  end
  test "should post update" do
    assert_no_difference('Album.count') do
      post :update,id: 1, album: {name: "album" ,position:3}
    end

    assert_redirected_to album_path(assigns(:album))
  end

  test "should get index json data" do
    get :index, :format => 'json'

    assert_response :success
    assert_not_equal "string", JSON.parse(response.body)
  end

  test "should get show json data" do
    get :show, :id => 1, :format => 'json'

    assert_response :success
    body = JSON.parse(@response.body)
    assert_equal body["name"] ,nil 
  end

end
