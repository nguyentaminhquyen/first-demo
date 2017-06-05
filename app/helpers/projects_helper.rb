module ProjectsHelper
  PROJECT_STATUS = { 1 => "NEW", 2 => "WORKING", 3 => "FINISH"}
	PROJECT_ROLE = {1 => "LEADER", 2 => "MEMBER"}
  def project_status(status_id)
    return PROJECT_STATUS[status_id]
  end

  def view_user_name(author_id)
    return User.find(author_id).name
  end

  def project_role(user_id)
    return PROJECT_ROLE[user_id]
  end
end
