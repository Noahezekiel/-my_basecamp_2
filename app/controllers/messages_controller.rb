class MessagesController < ApplicationController
    before_action :set_thread
    before_action :set_message, only: [:edit, :update, :destroy]
  
    def new
      @message = @thread.messages.new
    end
  
    def create
      @message = @thread.messages.new(message_params)
      @message.user = current_user
      
      if @message.save
        redirect_to project_project_thread_path(@project, @thread), notice: 'Message posted successfully.'
      else
        Rails.logger.debug "❌ Message creation failed: #{@message.errors.full_messages.join(', ')}"
        render :new
      end
    end

    def edit
      @project = Project.find(params[:project_id])
      @project_thread = ProjectThread.find(params[:project_thread_id])
      @message = Message.find(params[:id])
    end

    def update
      if @message.update(message_params)
        redirect_to project_project_thread_path(@project, @thread), notice: 'Message updated successfully.'
      else
        render :edit
      end
    end
  
    def destroy
      @message = @thread.messages.find(params[:id])
      @message.destroy
      redirect_to project_project_thread_path(@project, @thread), notice: 'Message deleted.'
    end
  
    private
  
    def set_thread
      @project = Project.find(params[:project_id])
      @thread = @project.project_threads.find(params[:project_thread_id])
    end
  
    def message_params
      params.require(:message).permit(:content)
    end
    
    def set_message
      @message = @thread.messages.find(params[:id])
    end
    
  end

  