class CommentsController < ApplicationController
  # def index
  # end

  # def new
  # 	@concert = Concert.find_by(id: params[:id])

  # 	@comment = @concert.comments.new
  # end

  def show
    @comment.user = User.find_by(id: params[:user_id])
  	@comments = Comment.find_by(id: params[:id])
  end

  def create
    @user = session[:user_id]

  	@concert = Concert.find_by(id: params[:concert_id])

  	@comment = @concert.comments.new(comment_params)

    @comment.user_id = @user

  	if @comment.save
  		redirect_to concert_path(@concert)
  	end
  end

  def destroy
  	@comments = Comment.find_by(id: params[:id])
  	
  	@comments.destroy

  	redirect_to concerts_path
  end

  private

  def comment_params
  	params.require(:comment).permit(:comment, :name)
  end
end
