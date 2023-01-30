class Book < ApplicationRecord

  with_options presence: true do
    validates :book_name, :author, :image_url, :publishd_date, :publisher
    validates :book_review
  end  

  belongs_to :user
end
