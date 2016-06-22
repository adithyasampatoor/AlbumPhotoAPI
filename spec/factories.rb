require 'faker'

FactoryGirl.define do

  factory :photo do
    name "Photo"
    description "Description"
    url "http://test.com/image.jpg"
    taken_at "2016-06-11"
    album
  end

  factory :album do
    name "Album"
    position 1

    factory :album_with_photos do
      transient do
        photos_count 50
      end
      after(:create) do |album, evaluator|
        create_list(:photo, evaluator.photos_count, album: album)
      end
    end

    factory :album_with_two_photos do
      after(:create) do |album|
        create(:photo, album: album, taken_at: '2016-01-01')
        create(:photo, album: album, taken_at: '2016-03-01')
        p album.photos.length
      end
    end
  end

end
