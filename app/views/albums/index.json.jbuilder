json.total @albums.total_count.to_s
json.total_pages @albums.num_pages.to_s
json.page @albums.current_page.to_s
json.next_page @albums.next_page.to_s.present? ? albums_url(page: @albums.next_page.to_s, format: 'json') : ''
json.prev_page @albums.prev_page.to_s.present? ? albums_url(page: @albums.prev_page.to_s, format: 'json') : ''
json.result do
  json.array! @albums do |album|
    json.id album.id
    json.name album.name
    json.position album.position
    json.photos_count album.photos.size
    json.average_date album.average_date
    json.created_at album.created_at
    json.updated_at album.updated_at
  end
end
