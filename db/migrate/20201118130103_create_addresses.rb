class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code       null:false
      t.integer :prefectures_id   null:false
      t.text :municipalities      null:false
      t.text :address             null:false
      t.text :building_name       
      t.string :phone_number      null:false
      t.reference :order          null:false

      t.timestamps
    end
  end
end
