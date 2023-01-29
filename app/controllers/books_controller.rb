class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    Book.create(book_params)
  end

  private
  def book_params
    params.require(:book).permit(
      :book_name, :author, :image_url, :publishd_date, :publisher, :read_status_id, :book_review
  ).merge(user_id: current_user.id)
  end
end
