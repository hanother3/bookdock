class OldBooksController < ApplicationController
  def index
    @old_books = OldBook.includes(:user).order('created_at DESC')
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

  private

  def old_book_params
    params.require(:old_book).permit(
      :image, :old_title, :old_book_description, :category_id, :book_condition_id, :delivery_charge_id, :area_id, :delivery_time_id, :price
    ).merge(user_id: current_user.id)
  end

end
