module ApplicationHelper
	PROJECT_STATUS = { 1 => "NEW", 2 => "PROCESSING", 3 => "FINISH"}
	PROJECT_ROLE = {1 => "LEADER", 2 => "MEMBER"}
	TASK_STATUS = { 1 => "NEW", 2 => "PROCESSING", 3 => "REVIEW", 4 => "FINISH" }
	def project_status(status_id)
		return PROJECT_STATUS[status_id]
	end

	def view_user_name(user_id)
		return User.find(user_id).name
	end

	def project_role(user_id)
		return PROJECT_ROLE[user_id]
	end

	def task_status(status_id)
		return TASK_STATUS[status_id]
	end
end
