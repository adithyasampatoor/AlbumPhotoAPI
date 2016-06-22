# Description

An Album Photo Project where you will find a RESTFUL API to add create an Album, add Photos to the Album.

##Following were taken care of

1. The albums index actions will return JSON with all available fields for the record AND a field for the total number of photos in the album.
2. The API index actions will use pagination with a max of 10 items per page and accept a param to iterate through pages.
3. An album's show action will return data for each photo in the album.
4. Every photo record belongs to an album, has a name and a url that ends with the string ".jpeg" or ".jpg".
5. No more than 60 photos can be added to an album.
6. Multiple photos can be added to an album from one request.
7. Album's average_date field is always the average taken_at date of all associated photos (or nil if the album has no photos).
8. Unit Test cases are in the folder test and spec
9. Test cases for the controller actions are in the test folder.

# Tech Specs
Rails 4.2.6, 
Ruby 2.2.0

# Getting Started
Run `bundle install` and `rake db:migrate`.
You can populate your database with fake data by running `rake db:seed`.



