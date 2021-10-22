class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    authorize @book
  end

  def new
    @book = Book.new
    authorize @book
  end

  def create
    @book = Book.create(book_params)
    @book.user = current_user
    authorize @book
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
    authorize @book
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book)
    authorize @book
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    authorize @book
    redirect_to root_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :edition, :author, :user_id)
  end
end
