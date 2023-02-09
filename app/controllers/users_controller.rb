class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @books = user.books    
    @old_books = user.old_books    
  end  
end
