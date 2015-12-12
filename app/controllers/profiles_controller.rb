class ProfilesController < ApplicationController
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
    @profile = Profile.new(profile_params)
    @profile.user_id = @user.id
    if @profile.save
      redirect_to profile_path(@profile.id)
    else
      render :new
    end
  end

  def destroy
    @profile.destroy
    redirect_to properties_path
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :age, :location)
  end


end
