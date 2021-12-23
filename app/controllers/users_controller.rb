class UsersController < ApplicationController

  def show
   @user = User.find(params[:id])
   @book = @user.books.page(params[:title, :body]).reverse_order

  end



end
