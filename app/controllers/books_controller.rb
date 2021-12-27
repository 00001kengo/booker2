class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice]="Book was successfully create."
      redirect_to book_path(@book.id)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end


  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
        redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
     if @book.update(book_params)
      flash[:notice]="Book was successfully updated."
      redirect_to book_path(@book)
     else
      render :edit
     end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice]="Book was successfully destroy."
    redirect_to books_path

  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end