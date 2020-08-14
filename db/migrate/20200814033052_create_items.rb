class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :image,                 null: false
      t.string :name,                null: false
      t.text :text,                  null: false
      t.integer :category,           null: false
      t.integer :condition,          null: false
      t.integer :delivery_fee,       null: false
      t.integer :ship_from_location, null: false
      t.integer :delivery_date,      null: false
      t.integer :price,              null: false
      t.references :user,            null: false,  foreign_key: true
      t.timestamps
    end
  end
end
