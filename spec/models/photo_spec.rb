require 'rails_helper'

<<<<<<< HEAD
RSpec.describe Photo, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
=======
describe Photo do
  
  it 'has a valid factory' do
    expect(FactoryGirl.create(:photo)).to be_valid
  end
  it 'is invalid without name' do
    expect(FactoryGirl.build(:photo, name: nil)).not_to be_valid
  end
  it 'is invalid without album' do
    expect(FactoryGirl.build(:photo, album: nil)).not_to be_valid
  end
  it 'is invalid without url' do
    expect(FactoryGirl.build(:photo, url: nil)).not_to be_valid
  end
  it 'is invalid without jpg or jpeg in url' do
    expect(FactoryGirl.build(:photo, url: 'http://test.com/')).not_to be_valid
  end

>>>>>>> Albums & Photos Website, also Included the test cases
end
