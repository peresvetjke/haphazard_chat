class UsersController < ApplicationController
  before_action :load_users

  def index
  end

  private

  def load_users
    @users = User.all
  end
end