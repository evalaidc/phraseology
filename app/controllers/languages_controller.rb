class LanguagesController < ApplicationController

  def index
    @languages = Language.all
  end

  def new
    @language = Language.new
  end

  def create
    @language = Language.create(language_params.merge(user: current_user))
    redirect_to language_path(@language)
  end

  def show
    @language = Language.find(params[:id])
    @gatherings = @language.gatherings.all
  end

  def edit
    @language = Language.find(params[:id])
  end

  def update
    @language = Language.find(params[:id])
    if @language.user == current_user
      @language.update(language_params)
    else
      flash[:alert] = "Only the creator of the language-level can edit"
    end
    redirect_to language_path(@language)
  end

  def destroy
    @language = Language.find(params[:id])
    if @language.user == current_user
      @language.destroy
    else
      flash[:alert] = "Only the creator of the language-level can delete"
    end
    redirect_to languages_path
  end

  private
  def language_params
    params.require(:language).permit(:level, :description, :photo_url,)
  end

end
