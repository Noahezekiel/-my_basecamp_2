class MessagesController < ApplicationController
    before_action :set_thread
  
    def new
      @message = @thread.messages.new
    end
  
    def create
      @message = @thread.messages.new(message_params)
      @message.user = current_user
      if @message.save
        redirect_to @thread, notice: 'Message posted successfully.'
      else
        render :new
      end
    end
  
    def destroy
      @message = @thread.messages.find(params[:id])
      @message.destroy
      redirect_to @thread, notice: 'Message deleted.'
    end
  
    private
  
    def set_thread
      @thread = Thread.find(params[:thread_id])
    end
  
    def message_params
      params.require(:message).permit(:content)
    end
  end
  