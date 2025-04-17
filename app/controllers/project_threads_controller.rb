class ProjectThreadsController < ApplicationController
  before_action :set_project
  before_action :set_thread, only: [:show, :destroy]
  
  def new
    @thread = @project.project_threads.new
  end

  def create
    @thread = @project.project_threads.new(thread_params)
    if @project.user == current_user || current_user.admin?
      if @thread.save
        redirect_to @project, notice: 'Thread created successfully.'
      else
        render :new
      end
    else
      redirect_to @project, alert: 'You are not authorized to create a thread.'
    end
  end

  def show
    @project = Project.find(params[:project_id])
    @thread = @project.project_threads.find(params[:id])
    @messages = @thread.messages.includes(:user).order(created_at: :asc)
  end    

  def destroy
    @thread.destroy
    redirect_to @project, notice: 'Thread deleted.'
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_thread
    @thread = @project.project_threads.find(params[:id])
  end

  def thread_params
    params.require(:project_thread).permit(:title, :content, :description)
  end
end
