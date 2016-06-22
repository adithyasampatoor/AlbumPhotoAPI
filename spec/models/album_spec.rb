require 'rails_helper'

<<<<<<< HEAD
RSpec.describe Album, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
=======
describe Album do
  
  it 'has a valid factory' do
    expect(FactoryGirl.create(:album)).to be_valid
  end
  it 'is invalid without a name' do
    expect(FactoryGirl.build(:album, name: nil)).not_to be_valid
  end
  it 'cannot contain more than 60 photos' do
    album = FactoryGirl.create(:album_with_photos, photos_count: 60)
    expect(FactoryGirl.build(:photo, album: album)).not_to be_valid
  end

>>>>>>> Albums & Photos Website, also Included the test cases
end
