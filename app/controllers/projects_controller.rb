class ProjectsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:search_by_name]
  before_action :authorize
  before_action :set_project, only: [:show, :edit, :update, :delete]
  layout 'projects/dashboard'

  def index
    @page_name = "Dashboard"
    @current_page = "index"
  end

	def projects_list
    @page_name = "Project list"
    @current_page = "projects"
    if params[:proj_name].present?
      @projects = Project.search(current_user.id,params[:proj_name],params[:page])
    else
      @projects = Project.get_projects_by_user(current_user.id,params[:page])
    end
	end

  def new
    @page_name = "Create new project"
    @project = Project.new
    @user_list = User.where.not(id: current_user.id)
  end

  def create
    @project = Project.new(project_param)
    @project.author_id = current_user.id
    @project.status = 1
		@project.start_time = DateTime.strptime(project_param[:start_time],'%Y-%m-%d')
    @project.end_time = DateTime.strptime(project_param[:end_time],'%Y-%m-%d')
    if @project.save
      redirect_to '/projects'
    end
  end

  def edit
    @current_page = "Edit project"
    @user_list = User.where.not(id: current_user.id)
  end

  def update
    @page_name = "Edit project details"
    @project.start_time = DateTime.strptime(project_param[:start_time],'%Y-%m-%d')
    @project.end_time = DateTime.strptime(project_param[:end_time],'%Y-%m-%d')
    if @project.update(project_param)
      redirect_to '/projects'
    else
      render 'edit'
    end
  end

  def delete
    @project.destroy
    redirect_to '/projects'
	end

	def show
    @page_name = "Project detail"
		session[:proj_id] = @project.id
    @task_list = @project.tasks.order(:name).paginate(:page => params[:page],:per_page => 3)
		render 'show'
	end

  private
	  def set_project
			@project = Project.find(params[:id])
		end
    def project_param
      params.require(:project).permit(:name,:description,:start_time,:end_time,user_ids: [])
    end
end
