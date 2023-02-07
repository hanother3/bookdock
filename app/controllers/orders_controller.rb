class OrdersController < ApplicationController
  def index
    @old_book = OldBook.find(params[:old_book_id])
  end
end
