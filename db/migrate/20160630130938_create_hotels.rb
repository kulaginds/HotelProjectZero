class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :title
      t.float :rating, default: 0, null: false
      t.integer :breakfast
      t.text :description
      t.string :photo
      t.integer :price
      t.string :country
      t.string :state
      t.string :city
      t.string :street

      t.timestamps null: false
    end
  end
end
