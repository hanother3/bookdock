class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def book_params
    params.require(:book).permit(
      :book_name, :author, :image_url, :publishd_date, :publisher, :read_status_id, :book_review
  ).merge(user_id: current_user.id)
  end
end
