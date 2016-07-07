class CommentsController < ApplicationController
  # before_filter :authenticate_user!
  def create
    @hotel = Hotel.find(params[:hotel_id])
    @comment = @hotel.comments.create(comment_params)
    redirect_to @hotel
  end

  def destroy
    @hotel = Hotel.find(params[:hotel_id])
    @comment = @hotel.comments.find(params[:id])
    @comment.destroy
    redirect_to @hotel
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
