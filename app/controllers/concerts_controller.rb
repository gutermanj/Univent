class ConcertsController < ApplicationController
  def index
  	@concerts = Concert.all
  	@concerts_today = @concerts.where(date: Date.today)
  	@concerts_this_month = @concerts.where('extract(month from date) = ?', Date.today.month)
    @user_id = session[:user_id]

  end

  def show
  	@concert = Concert.find_by(id: params[:id])
  	@deletecomment = Comment.find_by(id: params[:id])
  	@comments = @concert.comments.all
  	@comment = @concert.comments.new
    @user_id = session[:user_id]
    @user = User.find_by(email: params[:email])
  end

  def new
    @user = User.find_by(id: params[:user_id])
  	@concert = Concert.new
    @user_id = session[:user_id]

    if session[:user_id] == nil
      not_found
    end

  end

  def create
    @user = User.find_by(id: params[:user_id])

  	@concert = @user.concerts.new(concert_params)

    if @concert.save
      redirect_to concerts_path
    end

  	
  end

  def destroy
  	@comment = Comment.find_by(id: params[:id])

  	@concert = Concert.find_by(id: params[:id])
  	
  	@concert.destroy

  	redirect_to concerts_path
  end

  private

  def concert_params
    params.require(:concert).permit(:artist, :venue, :city, :date, :price, :description)
  end
end
