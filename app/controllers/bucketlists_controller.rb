class BucketlistsController < ApplicationController
  before_action :find_profile, only: [:new, :create, :show, :edit]
  before_action :find_bucketlist, only: [:show, :edit, :update]

  def new
    # @user = current_user
    @bucketlist = Bucketlist.new
  end

  def create
    @bucketlist = Bucketlist.new(bucketlist_params)
    if @bucketlist.save
      redirect_to profile_bucketlists_path(@bucketlist)
    else
      render :new
    end
  end

  def show
    ##
    @profile = current_user.profile
  end

  def edit
    ##
    @profile = Bucketlist.profile(:id)
    @bucketlist.update(bucketlist_params)
  end

  def update
    
  end

  def index
    @bucketlists = Bucketlist.all
  end

  def destroy
    @bucketlist = Bucketlist.find(params[:id])
    if @bucketlist.destroy
      redirect_to profile_bucketlists_path
    end
  end

  private

  def bucketlist_params
    params.require(:bucketlist).permit(:location, :title, :profile_id, :completed)
  end

  def find_user
    @user = current_user
  end

  def find_profile
    @profile = Profile.find(current_user)
  end

  def find_bucketlist
    @bucketlist = Bucketlist.find_by(profile_id: params[:profile_id])
  end

  # def completed
  #   binding.pry
  #   {completed:1, id: params[:id]}
  # end

  # def not_completed 
  #   binding.pry
  #   {completed:2, id: params[:id]}
  # end

end
