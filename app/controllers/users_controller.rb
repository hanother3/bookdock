class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @books_read = user.books.where(read_status_id: 2)
    @books_unread = user.books.where(read_status_id: 3)
    @old_books = user.old_books    
  end  
end
