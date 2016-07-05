class Hotel < ActiveRecord::Base
  mount_uploader :photo, HotelUploader
  validates :title, presence: true
end
