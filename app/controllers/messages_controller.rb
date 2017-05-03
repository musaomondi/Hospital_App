class MessagesController < ApplicationController
  def create
    @message = current_patient.messages.build(message_params)
    if @message.save
      flash[:success] = "Message created!"
      redirect_to patient_path
    else
      # render 'static_pages/home'
    end
  end
  def destroy
  end
  private
  def message_params
    params.require(:message).permit(:content)
  end
end
