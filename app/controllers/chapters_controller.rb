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
    ordered_chapter_ids = params[:chapter_ids]
    @grouped_chapters = @book.chapters.where(id: ordered_chapter_ids).group_by(&:id)
    index_no = 1
    ordered_chapter_ids.each do |chapter_id|
      chapter_id = chapter_id.to_i
      chapter = @grouped_chapters[chapter_id][0]
      chapter.update_attribute(:position, index_no)
      index_no += 1
    end
    render nothing: true
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
