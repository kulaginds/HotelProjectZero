class HotelSerializer < ActiveModel::Serializer
	
  attributes :id, :title, :rating, :breakfast, :description, :photo, :price, :country, :state, :city, :street, :created_at

  def photo()
  	object.photo.thumb
  end

end
