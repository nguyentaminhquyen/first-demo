class SessionsController < ApplicationController
	 skip_before_action :verify_authenticity_token
	 def login
		 	user = User.authenticate(params[:username],params[:password])
			if user
				session[:user_id] = user.id
				redirect_to '/'
			end
	 end

	 def logout
 		session[:user_id] = nil
 		redirect_to '/login'
 	end

end
