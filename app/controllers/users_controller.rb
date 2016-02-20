class UsersController < ApplicationController
	def index
		@users = User.all
		@user = User.find_by(id: params[:id])

		@user_id = session[:user_id]

	end

	def new
	@user = User.new
	@user_id = session[:user_id]
	end

	def create
		@user_id = User.find_by(session[:id])
  		@user = User.new(
  			:username => params[:user][:username],
			:email => params[:user][:email],
			:password => params[:user][:password])
  respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        session[:username] = @user.username
        session[:email] = @user.email
        format.html { redirect_to user_path(@user), notice: 'Your account was created' }
        flash[:notice] = 'Your account was successfully created.'
      else
        format.html { render :new }
      end
    end
end
	def show
		@user = User.find_by(id: params[:id])
		@user_id = session[:user_id]

	end

end
