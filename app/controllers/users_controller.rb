class UsersController < ApplicationController
  def show
    @profile = Profile.find_by user_id: params[:user_id]
  end

  def index
    @users = User.all
  end
end
