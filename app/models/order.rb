class Order < ApplicationRecord
  belongs_to :user
  belongs_to :old_book
  has_one :address, dependent: :destroy
end
