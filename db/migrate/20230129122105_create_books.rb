class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :title
      t.string :author
      t.string :image_url
      t.string :publishd_date
      t.string :publisher
      t.integer :read_status_id
      t.text :book_review,         null: false
      t.references :user,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
