class BucketlistController < ApplicationController
  def new
    @bucketlist = Bucketlist.new
  end

  def create
    @bucketlist = Bucketlist.find(params[:id])
    if @bucketlist.save
      #
      redirect_to profile_bucketlist_path(@bucketlist)
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
    params.require(:bucketlist).permit(:location, :title)
  end

end
