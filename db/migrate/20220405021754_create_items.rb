class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :items_name,              null: false
      t.text       :items_comments,          null: false
      t.integer    :price,                   null: false
      t.references :user, foreign_key: true, null: false
      t.integer    :category_id,             null: false
      t.integer    :condition_id,            null: false
      t.integer    :shipping_price_id,       null: false
      t.integer    :shipping_area_id,        null: false
      t.integer    :shipping_date_id,        null: false 
      t.timestamps
    end
  end
end
