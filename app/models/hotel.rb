class Hotel < ActiveRecord::Base
  mount_uploader :photo, HotelUploader
  validates :title, presence: true
  has_many :comments, dependent: :destroy
  paginates_per 2
  ratyrate_rateable "rating"

end
