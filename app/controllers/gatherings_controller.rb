class GatheringsController < ApplicationController

  def new
    @language = Language.find(params[:language_id])
    @gathering = @language.gatherings.new
  end

  def create
    @language = Language.find(params[:language_id])
    @gathering = @language.gatherings.create(gathering_params.merge(user: current_user))
    redirect_to language_path(@language)
  end

  def show
    @language = Language.find(params[:language_id])
    @gathering = @language.gatherings.find(params[:id])
    @comments = @gathering.comments.all
    @users = @gathering.users.all
  end

  def edit
    @language = Language.find(params[:language_id])
    @gathering = Gathering.find(params[:id])
  end

  def update
    @language = Language.find(params[:language_id])
    @gathering = Gathering.find(params[:id])
    if @gathering.user == current_user
      @gathering.update(gathering_params)
    else
      flash[:alert] = "Only the creator of the social gathering can edit"
    end
    redirect_to language_gathering_path(@language,@gathering)
  end

  def destroy
    @language = Language.find(params[:language_id])
    @gathering = Gathering.find(params[:id])
    if @gathering.user == current_user
      @gathering.destroy
    else
      flash[:alert] = "Only the creator of the social gathering can edit"
    end
    redirect_to language_path(@language)
  end

  def add_attendance
    @gathering = Gathering.find(params[:id])
    @gathering.attendances.create(user: current_user)
    redirect_to :back
    end

  def remove_attendance
    @gathering = Gathering.find(params[:id])
    @gathering.attendances.where(user: current_user).destroy_all
    redirect_to :back
    end

  private
  def gathering_params
    params.require(:gathering).permit(:topic, :location, :date, :time, :photo_url, :description)
  end
end
