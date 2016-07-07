class AddUserRefToHotels < ActiveRecord::Migration
  def change
    add_reference :hotels, :user, index: true, foreign_key: true
  end
end
