class CommentsController < ApplicationController
  before_action :comment_params, only: [:create]
  # before_filter :authenticate_user!

  def create
    @hotel = Hotel.find(params[:hotel_id])
    @comment = @hotel.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to @hotel
  end

  def destroy
    @hotel = Hotel.find(params[:hotel_id])
    @comment = @hotel.comments.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
    end
    redirect_to @hotel
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
