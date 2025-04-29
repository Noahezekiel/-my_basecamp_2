class ProjectMembershipsController < ApplicationController
    before_action :set_project
  
    def create
      unless @project.user == current_user
        redirect_to @project, alert: "Only the project creator can invite users." and return
      end
  
      user = User.find_by(email: params[:email])
      if user
        if @project.members.include?(user)
          redirect_to @project, alert: "#{user.email} is already a member." and return
        end
  
        @project.project_memberships.create(user: user, role: :member)
        redirect_to @project, notice: "#{user.email} has been added to the project."
      else
        redirect_to @project, alert: "User with that email not found."
      end
    end
  
    private
  
    def set_project
      @project = Project.find(params[:project_id])
    end
end
  