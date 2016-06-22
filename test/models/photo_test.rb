require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  
  test "album_id name url are not empty" do
  	photo = Photo.new

  	assert !photo.save
  	assert photo.errors["album_id"].any?
  	assert photo.errors[:name].any?
  	assert photo.errors[:url].any?
  end

  test "url should be real url and contain jpeg or jpg" do
  	photo = Photo.new("album_id" => 1,
  						:name => "testing",
  						:description => "testing testing")
  	photo.url = "abc/create.jpb"

  	assert_no_match /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/, photo.url, "not match"

  	photo.url = "https://robohash.org"

  	assert photo.invalid?, "has not image"

  	photo.url = "https://robohash.org/1665acd2ea6229db204787e6ff6b1bb9.jpg?size=50x50&set=set1"
  	assert photo.valid?, "has image success!"
  end

  test "album cannot has more than 60 photo" do
  	count = Photo.where(album_id: 1).count

  	assert_operator count, "<" , 60
  end
end
