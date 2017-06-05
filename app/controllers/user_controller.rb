class UserController < ApplicationController
  skip_before_action :verify_authenticity_token
  def login
    render 'login'
  end

  def forgot_password
    render 'forgot_password'
  end

  def signup
    render 'signup'
  end

  def create
    @user = User.new
		@user.name = params[:name]
    @user.password = params[:password]
    @user.email = params[:email]
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
	end


end
