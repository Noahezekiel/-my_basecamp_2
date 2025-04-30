class ProjectThreadsController < ApplicationController
  before_action :set_project
  before_action :set_thread, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @thread = @project.project_threads.new
  end

  def create
    @thread = @project.project_threads.new(thread_params)
    if @thread.save
      redirect_to @project, notice: 'Thread created successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @messages = @thread.messages.includes(:user).order(created_at: :asc)
  end

  def edit
  end

  def update
    if @thread.update(thread_params)
      redirect_to project_path(@project), notice: 'Thread updated successfully.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @thread.destroy
    redirect_to project_path(@project), notice: 'Thread deleted.'
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

  def authorize_admin!
    membership = @project.project_memberships.find_by(user: current_user)

    unless current_user == @project.user || (membership && membership.role == "admin")
      redirect_to project_path(@project), alert: "Only admins can manage threads."
    end
  end
end
