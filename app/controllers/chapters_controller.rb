class ChaptersController < ApplicationController
before_action :fetch_book, only: [:create]

  def create
    @chapter = @book.chapters.new(chapter_params)
    @chapter_saved = !!@chapter.save
  end

private

  def chapter_params
    params.require(:chapter).permit(:title, :notes)
  end

  def fetch_book
    @book = Book.find(params[:book_id])
  end

end
