class OldBooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_old_book, only: [:show, :edit, :update, :destroy]
  before_action :contributor_confirmation, only: [:edit, :destroy]

  def index
  end   

  def new
    @old_book = OldBook.new
  end  

  def create
    @old_book = OldBook.new(old_book_params)
    if @old_book.save
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
    if @old_book.update(old_book_params)
      redirect_to old_book_path(@old_book)
    else
      render :edit
    end
  end    

  def destroy
    @old_book.destroy
    redirect_to root_path
  end

  private

  def old_book_params
    params.require(:old_book).permit(
      :image, :old_title, :old_book_description, :category_id, :book_condition_id, :delivery_charge_id, :area_id, :delivery_time_id, :price
    ).merge(user_id: current_user.id)
  end

  def set_old_book
    @old_book = OldBook.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @old_book.user
  end

end
