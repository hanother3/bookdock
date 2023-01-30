class Book < ApplicationRecord

  with_options presence: true do
    validates :book_name, :author, :publishd_date, :publisher
    # validates :image_url
    validates :book_review
  end  

  belongs_to :user
end
