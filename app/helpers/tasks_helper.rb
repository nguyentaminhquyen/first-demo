module TasksHelper
	def back_to_project_detail_page
		"/projects/#{session[:proj_id]}"
	end
end
