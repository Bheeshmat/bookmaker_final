class SectionsController < ApplicationController
before_action :fetch_chapter
before_action :fetch_section, only: [:show, :update, :destroy]

  def create
    @section = @chapter.sections.new(section_params)
    @save_success = @section.save
  end

  def show
  end

  def update
    @section.update_attributes(section_params)
  end

  def destroy
    if @section.title.downcase == params[:title_confirmation].downcase
      @section.destroy
      @destroy_failed = false
      flash[:success] = I18n.t('flash_messages.sections.deletion_success')
    else
      @destroy_failed = true
      flash[:danger] = I18n.t('flash_messages.sections.deletion_failure')
    end
  end

private

  def fetch_chapter
    @book = Book.find(params[:book_id])
    @chapter = @book.chapters.find(params[:chapter_id])
  end

  def fetch_section
    @section = @chapter.sections.find(params[:id])
  end

  def section_params
    params.require(:section).permit(:title, :notes, :content)
  end

end
