class BooksController < ApplicationController
# before_action get_book only: [:show, :destroy]
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
      flash[:success] = I18n.t('flash_messages.books.creation_success')
    else
      render 'new'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    if params[:title_confirmation].downcase == @book.title.downcase
      @book.delete
      redirect_to books_path
      flash[:success] = I18n.t('flash_messages.books.deletion_success')
    else
      redirect_to book_path(@book)
      flash[:danger] = I18n.t('flash_messages.books.deletion_failure')
    end
  end

private

  def book_params
    params.require(:book).permit(:title, :notes)
  end

  def get_book
    @book = Book.find(params[:id])
  end

end
