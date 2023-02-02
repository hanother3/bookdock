class Book < ApplicationRecord

  with_options presence: true do
    validates :isbn
    validates :read_status_id
    validates :book_review
  end  

  belongs_to :user
end
