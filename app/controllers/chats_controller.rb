class ChatsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_chat

  def show
  end

  private

  def load_chat
    @chat = Chat.find(params[:id])
  end
end