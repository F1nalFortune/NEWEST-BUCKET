class ProfileController < ApplicationController
  


  def index
    @profiles = Profiles.all
  end


  def show

  end

  def edit
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new
    @profile.user_id = @user.id
    if @profile.save
      redirect_to
end
