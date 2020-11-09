class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product_name
      t.text :explanation
      t.integer :category_id
      t.integer :status_id
      t.integer :burden_id
      t.integer :price
      t.integer :source_id
      t.integer :shipping_days_id
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
