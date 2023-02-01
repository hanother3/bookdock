class BooksController < ApplicationController
  def index
    @books = Book.includes(:user).order('created_at DESC')
  end

  def search
    @book = Book.new
    @books = RakutenWebService::Books::Book.search(title: params[:keyword]) if params[:keyword].present?
  rescue StandardError => e
    redirect_to books_url, alert: e.message
  end

  def new
      @book = Book.new(isbn: params[:isbn], title: params[:title], author: params[:author], image_url: params[:image_url])
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
    @book = Book.find(params[:id])
  end  

  def edit
    @book = Book.find(params[:id])
  end  

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render :edit
    end
  end    

  private

  def book_params
    params.require(:book).permit(
      :title, :author, :image_url, :publishd_date, :publisher, :read_status_id, :book_review
  ).merge(user_id: current_user.id, isbn: params[:isbn], title: params[:title],  author: params[:author], image_url: params[:image_url])
  end

end