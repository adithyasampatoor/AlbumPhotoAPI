# Populate albums and photos
50.times do |album_index|
  album = Album.create(name: Faker::Lorem.word.capitalize, position: album_index)

<<<<<<< HEAD
  50.times do |photo_index|
    album.photos.create(
      name: Faker::Lorem.word.capitalize,
      description: Faker::Lorem.sentence,
      url: Faker::Avatar.image(SecureRandom.hex, '50x50', 'jpg'),
      taken_at: Time.now - rand(100).days
=======
  rand(58..65).times do
    Photo.create(
      album_id: album.id,
      name: Faker::Lorem.word.capitalize,
      description: Faker::Lorem.sentence,
      url: Faker::Avatar.image(SecureRandom.hex, '50x50', 'jpg'),
      taken_at: Time.now - rand(20..100).days
>>>>>>> Albums & Photos Website, also Included the test cases
    )
  end
end
