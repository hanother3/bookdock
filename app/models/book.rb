class Book < ApplicationRecord

  with_options presence: true do
    validates :isbn
    validates :read_status_id
    validates :book_review
  end  

  validates :read_status_id, numericality: { other_than: 1 , message: "can't be blank"} 

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :read_status

  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  def favorited?(user)
    favorites.where(user_id: user.id).exists?
 end
end
