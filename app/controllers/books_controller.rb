class BooksController < ApplicationController
  def create
    @books = Book.all
    @new_book = current_user.books.new(book_params)
    @user = User.find(current_user.id)
    if @new_book.save
      redirect_to book_path(@new_book.id), notice: "You have created book successfully."
    else
      render :index
    end
  end

  def index
    @books = Book.all
    @new_book = Book.new
    @user = User.find(current_user.id)
  end

  def show
    @book = Book.find(params[:id])
    @new_book = Book.new
    @user = User.find(@book.user_id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, notice: "Book was successfully destroyed."
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
