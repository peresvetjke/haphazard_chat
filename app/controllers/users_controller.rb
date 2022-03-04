class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_users

  def index
  end

  private

  def load_users
    @users = User.all
  end
end