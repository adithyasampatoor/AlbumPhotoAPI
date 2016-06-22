<<<<<<< HEAD
class Photo < ActiveRecord::Base
  belongs_to :album
=======
class PhotoURLValidator < ActiveModel::Validator
  def validate(record)
    if record.url.present? && record.url =~ /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/
      last_chunk = record.url.split('.').last.downcase
      if !last_chunk.include?("jpg") && !last_chunk.include?("jpeg")
        record.errors[:url] << "must end with the string .jpeg or .jpg"
      end
    else
      record.errors[:url] << "must be present"
    end
  end
end

class PhotosLengthValidator < ActiveModel::Validator
  def validate(record)
    if Photo.where(album_id: record.album_id).count > 59
      record.errors[:photo] << "No more than 60 photos allowed in one album"
    end
  end
end

class Photo < ActiveRecord::Base

  belongs_to :album

  validates :album_id, :name, :url, presence: true
  validates_with PhotoURLValidator
  validates_with PhotosLengthValidator

  after_save :create_average_time

  def create_average_time
    time = 0
    self.album.photos.each do |photo|
      time = time + photo.taken_at.to_i
    end
    average_time = time/self.album.photos.length
    self.album.update_attribute(:average_date, Time.at(average_time))
  end

>>>>>>> Albums & Photos Website, also Included the test cases
end
