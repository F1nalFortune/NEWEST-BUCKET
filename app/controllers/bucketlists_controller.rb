class BucketlistsController < ApplicationController
  before_action :find_profile, only: [:new, :create, :show, :edit]
  before_action :find_bucketlist, only: [:create, :show, :edit, :update]

  def new
    # @user = current_user
    @bucketlist = Bucketlist.new
  end

  def create
    if @bucketlist.save
      #
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

  def find_bucketlist
    binding.pry
    @bucketlist = Bucketlist.find(params[:profile_id])
  end


end
