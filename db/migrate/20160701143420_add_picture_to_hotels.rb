class AddPictureToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :photo, :string
  end
end
