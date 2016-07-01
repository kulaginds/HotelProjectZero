class Hotel < ActiveRecord::Base
  mount_uploader :photo, HotelUploader
end
