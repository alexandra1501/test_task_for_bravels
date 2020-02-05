class ResourcesController < ApplicationController
  def index
    @resources = Resource.all
  end

  def new
    @resource = Resource.new
  end
   
  def create
    @resource = Resource.new(resource_params)
   
    if @resource.save
      redirect_to @resource
    else
      render 'new'
    end
  end

  def show
    @resource = Resource.find(params[:id])
  end
   
  private
    def resource_params
      params.require(:resource).permit(:url)
    end
end
