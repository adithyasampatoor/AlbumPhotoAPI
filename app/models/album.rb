class Album < ActiveRecord::Base
<<<<<<< HEAD
  has_many :photos
end
=======

  has_many :photos, dependent: :destroy

  validates :name, presence: true
  paginates_per 10

end


>>>>>>> Albums & Photos Website, also Included the test cases
