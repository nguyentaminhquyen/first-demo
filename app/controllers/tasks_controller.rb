class TasksController < ApplicationController
  before_action :authorize
  before_action :set_task, only: [:show, :edit, :update, :delete]
  before_action :set_member_list, only: [:new,:edit]
  layout 'projects/dashboard'
  def new
    @task = Task.new
  end

  def create
    @task = current_project.tasks.new(task_params)
    @task.assignner_id = current_user.id
    @task.start_time = DateTime.strptime(task_params[:start_time],'%Y-%m-%d')
    @task.end_time = DateTime.strptime(task_params[:end_time],'%Y-%m-%d')
    if @task.save
      redirect_to current_project_url
    end
  end

	def edit
    render 'edit'
	end

  def update
    @task.start_time = DateTime.strptime(task_params[:start_time],'%Y-%m-%d')
    @task.end_time = DateTime.strptime(task_params[:end_time],'%Y-%m-%d')
    if @task.update(task_params)
      redirect_to current_project_url
    end
  end

  def delete
    @task.destroy unless @task.nil?
    redirect_to current_project_url
  end

  private
    def set_member_list
      @member_list = User.joins(:members).where(:members => {:project_id => current_project.id})
    end

    def current_project_url
      "/projects/#{current_project.id}"
    end

    def current_project
      @project = Project.find(session[:proj_id]) if session[:proj_id]
    end

    def task_params
      params.require(:task).permit(:name,:description,:user_id,:status,:start_time,:end_time)
    end

    def set_task
      @task = current_project.tasks.find(params[:id])
    end
end
