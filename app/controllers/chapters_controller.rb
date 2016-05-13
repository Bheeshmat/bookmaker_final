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
    @new_sections = { @chapter.id => @chapter.sections.new }
  end

  def destroy
    if @chapter.sections.any?
      flash[:danger] = I18n.t('flash_messages.chapters.deletion_failure')
      @destroy_failed = true
    else
      @chapter.destroy
      flash[:success] = I18n.t('flash_messages.chapters.deletion_success')
    end
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
