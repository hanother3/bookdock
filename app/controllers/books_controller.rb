class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.includes(:user).order('created_at DESC')
    @old_books = OldBook.includes(:user).order('created_at DESC')
  end

  def search
    @book = Book.new
    @books = RakutenWebService::Books::Book.search(title: params[:keyword]) if params[:keyword].present?
  rescue StandardError => e
    redirect_to books_url, alert: e.message
  end

  def new
      @book = Book.new(isbn: params[:isbn], title: params[:title], author: params[:author], publisher: params[:publisher], image_url: params[:image_url], item_url: params[:item_url])
      @books = RakutenWebService::Books::Book.search(title: params[:keyword]) if params[:keyword].present?
    rescue StandardError => e
      redirect_to books_url, alert: e.message
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end  

  def edit
  end  

  def update
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render :edit
    end
  end    

  def destroy
    @book.destroy
    redirect_to root_path
  end

  private

  def book_params
    params.require(:book).permit(
      :title, :author, :image_url, :publishd_date, :publisher, :read_status_id, :book_review
  ).merge(user_id: current_user.id, isbn: params[:isbn], title: params[:title],  author: params[:author], publisher: params[:publisher], image_url: params[:image_url], item_url: params[:item_url])
  end

  def set_book
    @book = Book.find(params[:id])
  end

end