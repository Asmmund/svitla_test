class CampaignsController < ApplicationController
  respond_to  :json

  def index
    respond_with Campaign.all
  end
  def show
    respond_with Campaign.find( params[:id] )
  end
  def create
      respond_with Campaign.create( params[:campaign] )
    # campaign =
    # if campaign
    # else
    #   respond_with format.json { render json: { error: 'Error creating record!' }, status: 422  }, location: campaigns_path
    # end
  end
  def update
    respond_with Campaign.update( params[:id], params[:campaign] )
  end
  def destroy
    respond_with Campaign.destroy( params[:id] )
  end
end
