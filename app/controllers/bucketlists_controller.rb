class BucketlistsController < ApplicationController
  before_action :find_user, only: [:create, :show, :edit]
  before_action :find_profile

  def new
    @user = User.find(params[:id])
    @bucketlist = Bucketlist.new
  end

  def create
    @bucketlist = Bucketlist.find(params[:id])
    if @bucketlist.save
      #
      redirect_to profile_bucketlists_path(@bucketlist)
    else
      render :new
    end
  end

  def show
    @bucketlist = Bucketlist.find(params[:id])
    ##
    @profile = current_user.profile
  end

  def edit
    @bucketlist = Bucketlist.find(params[:id])
    ##
    @profile = Bucketlist.profile(:id)
    @bucketlist.update(bucketlist_params)
  end

  def update
    @bucketlist = Bucketlist.find(params[:id])
  end

  def index
    @bucketlists = Bucketlist.all
  end

  private

  def bucketlist_params
    params.require(:bucketlist).permit(:location, :title, :profile_id)
  end

  def find_user
    @user = current_user
  end

  def find_profile
    @profile = Profile.find(params[:profile_id])
  end


end
