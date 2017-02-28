class CommentsController < ApplicationController
  def new
    @language = Language.find(params[:language_id])
    @gathering = @language.gatherings.find(params[:gathering_id])
    @comment = @gathering.comments.new
  end

  def create
    @language = Language.find(params[:language_id])
    @gathering = @language.gatherings.find(params[:gathering_id])
    @comment = @gathering.comments.create(comment_params.merge(user: current_user))
    redirect_to language_gathering_path(@language,@gathering)
  end

  def edit
    @language = Language.find(params[:language_id])
    @gathering = Gathering.find(params[:gathering_id])
    @comment = @gathering.comments.find(params[:id])
  end

  def update
    @language = Language.find(params[:language_id])
    @gathering = Gathering.find(params[:gathering_id])
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      @comment.update(comment_params)
    else
      flash[:alert] = "Only the creator of the social gathering can edit"
    end
    redirect_to language_gathering_path(@language,@gathering)
  end

  def destroy
    @language = Language.find(params[:language_id])
    @gathering = Gathering.find(params[:gathering_id])
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
    else
      flash[:alert] = "Only the creator of the social gathering can edit"
    end
    redirect_to language_gathering_path(@language, @gathering)
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
