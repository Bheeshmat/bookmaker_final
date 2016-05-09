class ChaptersController < ApplicationController
before_action :fetch_book
before_action :fetch_chapter, only: [:edit, :update, :destroy]

  def create
    @chapter = @book.chapters.new(chapter_params)
    @chapter_saved = !!@chapter.save
    @new_sections = { @chapter.id => @chapter.sections.new }
  end

  def edit
  end

  def update
    @chapter.reload unless @chapter.update_attributes(chapter_params)
  end

  def destroy
    @chapter.destroy
  end

  def sort
    debugger
  end

private

  def chapter_params
    params.require(:chapter).permit(:title, :notes)
  end

  def fetch_book
    @book = Book.find(params[:book_id])
  end

  def fetch_chapter
    @chapter = @book.chapters.find(params[:id])
  end

end
