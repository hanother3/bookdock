class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :book_name,         null: false
      t.string :author,            null: false
      t.string :image_url,         null: false
      t.string :publishd_date,     null: false
      t.string :publisher,         null: false
      t.integer :read_status_id
      t.text :book_review,         null: false
      t.references :user,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
