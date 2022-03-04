class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_users

  def start_chat
    user = User.find(params[:id])
    chat = current_user.start_chat_with(user)
    redirect_to chat
  end

  def index
  end

  private

  def load_users
    @users = User.all
  end
end