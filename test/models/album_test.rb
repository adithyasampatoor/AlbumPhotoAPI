require 'test_helper'

class AlbumTest < ActiveSupport::TestCase

  fixtures :albums
  
  test "name of album must not be empty" do
  	album = Album.new

  	assert	album.invalid?
  	assert  album.errors[:name].any?
  end
  
end
