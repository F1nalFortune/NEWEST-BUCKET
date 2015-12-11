class BucketlistController < ApplicationController
  def new
    @bucketlist = Bucketlist.new
  end

  def create
    @bucketlist = Bucketlist.find(params[:id])
  end

  def show
    @bucketlist = Bucketlist.find(params[:id])
    @profile = current_user.profile
  end

  def edit
    @bucketlist = Bucketlist.find(params[:id])
    @profile = Bucketlist.profile(:id)
    @bucketlist.update(bucketlist_params)
  end

  def update



  def index
  end
end
