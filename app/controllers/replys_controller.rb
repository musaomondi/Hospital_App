class ReplysController < ApplicationController
  # before_action :set_message
  def new
    @reply = Reply.new
  end
  def create
    @reply = Reply.new(reply_params)
    # @message = Message.find(@reply.message_id)
    if @reply.save
      respond_to do |format|
        format.js {}
      end
    end
  end
  private
  def reply_params
    params.require(:reply).permit(:content)
  end
  # def set_message
  #   @message = Message.find(params[:id])
  # end
end
