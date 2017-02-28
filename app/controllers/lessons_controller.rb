class LessonsController < ApplicationController
  def index
    @lessons = lesson.all
  end

  def new
    @language = Language.find(params[:language_id])
    @lesson = @language.lessons.new
  end

  def create
    @language = Language.find(params[:language_id])
    @lesson = @language.lessons.create(lesson_params.merge(user: current_user))
    redirect_to language_path(@language)
  end

  def show
    @language = Language.find(params[:language_id])
    @lesson = @language.lessons.find(params[:id])
  end

  def edit
    @language = Language.find(params[:language_id])
    @lesson = Lesson.find(params[:id])
  end

  def update
    @language = Language.find(params[:language_id])
    @lesson = Lesson.find(params[:id])
    if @lesson.user == current_user
      @lesson.update(lesson_params)
    else
      flash[:alert] = "Only the creator of the lesson can edit"
    end
    redirect_to language_lesson_path(@language,@lesson)
  end

  def destroy
    @language = Language.find(params[:language_id])
    @lesson = Lesson.find(params[:id])
    if @lesson.user == current_user
      @lesson.destroy
    else
      flash[:alert] = "Only the creator of the lesson can edit"
    end
    redirect_to language_path(@language)
  end

  private
  def lesson_params
    params.require(:lesson).permit(:title, :photo_url, :link_url, :summary)
  end
end
