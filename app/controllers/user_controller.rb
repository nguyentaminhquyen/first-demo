class UserController < ApplicationController
  def login
  end

  def forgot_password
  end

  def logout
  end

  private
    def user_params
      params.require(:user).permit(:email,:password)
    end

    def new_user_params
      params.require(:user).permit(:email,:name,:password)
    end
end
