class ProfilesController < ApplicationController
  before_action :find_profile, only: [:show, :edit]
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
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to profile_bucketlists_path(@profile.id)
    else
      render :new
    end
  end


  private

  def profile_params
    params.require(:profile).permit(:name, :age, :location)
  end

  def find_profile
    @profile = Profile.find(params[:id])
  end



end
