class OldBooksController < ApplicationController
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
    @old_book = OldBook.find(params[:id])
  end  

  def edit
    @old_book = OldBook.find(params[:id])
  end  

  def update
    @old_book = OldBook.find(params[:id])
    if @old_book.update(old_book_params)
      redirect_to old_book_path(@old_book)
    else
      render :edit
    end
  end    

  def destroy
    @old_book = OldBook.find(params[:id])
    @old_book.destroy
    redirect_to root_path
  end

  private

  def old_book_params
    params.require(:old_book).permit(
      :image, :old_title, :old_book_description, :category_id, :book_condition_id, :delivery_charge_id, :area_id, :delivery_time_id, :price
    ).merge(user_id: current_user.id)
  end

end
