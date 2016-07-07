# encoding: utf-8

class HotelUploader < CarrierWave::Uploader::Base


  include CarrierWave::MiniMagick

  storage :file

  def cache_dir
    '/tmp/cache'
  end

  version :thumb do
    process :resize_to_fit => [200,200]
  end

    process :resize_to_fit => [400,400]

  # def store_dir
  #   "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  # end

end
