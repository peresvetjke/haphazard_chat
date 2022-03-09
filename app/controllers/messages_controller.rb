class MessagesController < ApplicationController
  before_action :load_chat, only: :create
  before_action :load_message, only: %i[show, edit, update, destroy]

  def show
  end

  def new
  end

  def create
    @message = @chat.messages.new(message_params.merge({author: current_user}))

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message.chat, notice: "Message was succesfully created." }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@message, partial: "messages/form", locals: { message: @message }) }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message.chat, notice: "Message was succesfully updated." }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@message, partial: "messages/form", locals: { message: @message }) }
      end
    end
  end

  def destroy
    respond_to do |format|
      format.html {
        # chat = @message.chat
        # @message.destroy
        redirect_to @message.destroy.chat
      }
    end
  end

  private

  def load_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:body)
  end

  def load_chat
    @chat = Chat.find(params[:chat_id])
  end
end