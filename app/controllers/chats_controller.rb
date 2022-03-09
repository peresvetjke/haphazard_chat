class ChatsController < ApplicationController
  before_action :load_chats, only: :index
  before_action :load_chat, only: :show
  before_action :load_messages, only: :show

  def index
  end

  def show
  end

  private

  def load_chats
    @chats = current_user.chats
  end

  def load_chat
    @chat = Chat.find(params[:id])
  end

  def load_messages
    @messages = @chat.messages
  end
end