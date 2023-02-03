class OldBook < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :book_condition
  belongs_to :delivery_charge
  belongs_to :area
  belongs_to :delivery_time
  belongs_to :user

  with_options presence: true do
    validates :image, :old_title, :old_book_description, :price
  end  

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :book_condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_time_id, numericality: { other_than: 1, message: "can't be blank" }
end
