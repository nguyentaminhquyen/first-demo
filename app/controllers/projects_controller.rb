class ProjectsController < ApplicationController
  before_action :authorize
  layout 'projects/dashboard'
  def index
    @current_page = "index"
  end

	def projects_list
    @current_page = "projects"
    @projects = Project.paginate(:page => params[:page],:per_page => 3)
	end

	def delete
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to '/projects'
	end

  def new
    @project = Project.new
    @user_list = User.where.not(id: current_user.id)
  end

  def create
    @project = Project.new(project_param)
    @project.author_id = current_user.id
    @project.status = 1
		@project.start_time = DateTime.strptime(project_param[:start_time],'%Y-%m-%d')
    @project.end_time = DateTime.strptime(project_param[:end_time],'%Y-%m-%d')
    @project.members.role_id = 2
    if @project.save
      redirect_to '/projects'
    end
  end

  def edit
    @project = Project.find(params[:id])
    @user_list = User.where.not(id: current_user.id)
  end

  def update
    @project = Project.find(params[:id])
    @project.start_time = DateTime.strptime(project_param[:start_time],'%Y-%m-%d')
    @project.end_time = DateTime.strptime(project_param[:end_time],'%Y-%m-%d')
    if @project.update(project_param)
      redirect_to '/projects'
    else
      render 'edit'
    end
  end


	def show
		@project = Project.find(params[:id])
	end

  private
    def project_param
      params.require(:project).permit(:name,:description,:start_time,:end_time,user_ids: [])
    end
end
