require 'rails_helper'

RSpec.describe OldBook, type: :model do
  before do
    @old_book = FactoryBot.build(:old_book)
  end

  describe '古本出品登録' do
    context '出品登録できるとき' do
      it '全ての項目が存在し、価格が適切であれば登録できる' do
        expect(@old_book).to be_valid
      end
    end

    context '出品登録できないとき' do
      it 'imageが空では登録できない' do
        @old_book.image = nil
        @old_book.valid?
        expect(@old_book.errors.full_messages).to include "Image can't be blank"
      end
      it 'old_titleが空では登録できない' do
        @old_book.old_title = ''
        @old_book.valid?
        expect(@old_book.errors.full_messages).to include "Old title can't be blank"
      end
      it 'old_book_descriptionが空では登録できない' do
        @old_book.old_book_description = ''
        @old_book.valid?
        expect(@old_book.errors.full_messages).to include "Old book description can't be blank"
      end
      it 'priceが空では登録できない' do
        @old_book.price = ''
        @old_book.valid?
        expect(@old_book.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが¥300以上でないと登録できない' do
        @old_book.price = '299'
        @old_book.valid?
        expect(@old_book.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceは¥¥9,999,999以下でないと登録できない' do
        @old_book.price = '10000000'
        @old_book.valid?
        expect(@old_book.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceは半角数値でないと登録できない' do
        @old_book.price = '５００'
        @old_book.valid?
        expect(@old_book.errors.full_messages).to include('Price is not a number')
      end
      it 'category_idが空では登録できない' do
        @old_book.category_id = '1'
        @old_book.valid?
        expect(@old_book.errors.full_messages).to include("Category can't be blank")
      end
      it 'book_condition_idが空では登録できない' do
        @old_book.book_condition_id = '1'
        @old_book.valid?
        expect(@old_book.errors.full_messages).to include("Book condition can't be blank")
      end
      it 'delivery_charge_idが空では登録できない' do
        @old_book.delivery_charge_id = '1'
        @old_book.valid?
        expect(@old_book.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it 'area_idが空では登録できない' do
        @old_book.area_id = '1'
        @old_book.valid?
        expect(@old_book.errors.full_messages).to include("Area can't be blank")
      end
      it 'delivery_time_idが空では登録できない' do
        @old_book.delivery_time_id = '1'
        @old_book.valid?
        expect(@old_book.errors.full_messages).to include("Delivery time can't be blank")
      end
      it 'userが紐付いていないと登録できない' do
        @old_book.user = nil
        @old_book.valid?
        expect(@old_book.errors.full_messages).to include('User must exist')
      end
    end
  end
end
