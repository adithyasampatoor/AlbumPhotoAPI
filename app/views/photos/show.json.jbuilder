json.photo do
  json.id @photo.id
  json.album_id @photo.album_id
  json.name @photo.name
  json.description @photo.description
  json.url @photo.url
  json.taken_at @photo.taken_at
  json.created_at @photo.created_at
  json.updated_at @photo.updated_at
end
