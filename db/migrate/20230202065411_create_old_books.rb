class CreateOldBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :old_books do |t|
      t.string :old_title,           null: false
      t.text :old_book_description,  null: false
      t.integer :category_id
      t.integer :book_condition_id
      t.integer :delivery_charge_id
      t.integer :area_id
      t.integer :delivery_time_id
      t.integer :price,              null: false
      t.references :user,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
