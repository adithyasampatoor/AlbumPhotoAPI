if @message.present?
  json.message @message
end
json.album do
  json.id @album.id
  json.name @album.name
  json.position @album.position
  json.average_date @album.average_date
  json.photos_count @album.photos.size
  json.created_at @album.created_at
  json.updated_at @album.updated_at
  json.photos @album.photos do |photo|
    json.id photo.id
    json.album_id photo.album_id
    json.name photo.name
    json.description photo.description
    json.url photo.url
    json.taken_at photo.taken_at
    json.created_at photo.created_at
    json.updated_at photo.updated_at
  end
end
