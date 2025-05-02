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
  

    def promote
      membership = @project.project_memberships.find(params[:id])
      membership.update(role: "admin")
      redirect_to @project, notice: "#{membership.user.name} promoted to admin."
    end
    
    def demote
      membership = @project.project_memberships.find(params[:id])
      if membership.user != @project.user
        membership.update(role: "member")
        redirect_to @project, notice: "#{membership.user.name} demoted to member."
      else
        redirect_to @project, alert: "You cannot demote the project owner."
      end
    end
    
    def destroy
      @project = Project.find(params[:project_id])
      membership = @project.project_memberships.find(params[:id])
    
      if membership.user != @project.user
        membership.destroy
        redirect_to project_path(@project), notice: "#{membership.user.name} was removed from the project."
      else
        redirect_to project_path(@project), alert: "Project owner cannot be removed."
      end
    end
  
    private
  
    def set_project
      @project = Project.find(params[:project_id])
    end
end
  