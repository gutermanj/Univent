class UserSessionsController < ApplicationController
  def new
    @user = User.find_by(params[:id])
	 @user_id = session[:user_id]


  	render 'new'


  end

  def create
  	user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    session[:email] = user.email
    session[:username] = user.username
    flash[:notice] = "Thanks for logging in!"
    redirect_to user_path(user)
    else
       flash[:notice] = "Incorrect E-mail or Password"
       render action: 'new'
    end
  end

  def destroy
  session[:user_id] = nil
   redirect_to concerts_path
  end
end
