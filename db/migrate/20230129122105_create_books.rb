class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :isbn,              null: false
      t.string :title
      t.string :author
      t.string :publisher
      t.string :image_url         
      t.string :item_url
      t.integer :read_status_id,   null: false
      t.text :book_review,         null: false
      t.references :user,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
