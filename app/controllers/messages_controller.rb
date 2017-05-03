class MessagesController < ApplicationController
  def index
    @messages = Message.paginate(:page => params[:page])
  end
  def create
    @message = current_patient.messages.build(message_params)
    if @message.save
      flash[:success] = "Message created!"
      redirect_to patient_path
    else
      @feed_items = []
      # render 'static_pages/home'
    end
  end
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to messages_path
  end
  private
  def message_params
    params.require(:message).permit(:content)
  end
end
