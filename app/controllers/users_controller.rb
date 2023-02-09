class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @books = current_user.books    
    @old_books = current_user.old_books    
  end  
end
