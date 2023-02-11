require 'rails_helper'

RSpec.describe Book, type: :model do
  before do
    @book = FactoryBot.build(:book)
  end

  describe '読書投稿登録' do
    context '読書投稿できるとき' do
      it '全ての項目が存在し、価格が適切であれば登録できる' do
        expect(@book).to be_valid
      end
    end

    context '読書投稿できないとき' do
      it 'isbnが空では登録できない' do
        @book.isbn = nil
        @book.valid?
        expect(@book.errors.full_messages).to include "Isbn can't be blank"
      end
      it 'read_status_idが空では登録できない' do
        @book.read_status_id = '1'
        @book.valid?
        expect(@book.errors.full_messages).to include("Read status can't be blank")
      end
      it 'book_reviewが空では登録できない' do
        @book.book_review = nil
        @book.valid?
        expect(@book.errors.full_messages).to include "Book review can't be blank"
      end
      it 'userが紐付いていないと登録できない' do
        @book.user = nil
        @book.valid?
        expect(@book.errors.full_messages).to include('User must exist')
      end
    end
  end
end
