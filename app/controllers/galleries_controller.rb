class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
    render :index
  end

  def new
    @gallery = Gallery.new
    render :new
  end

  def create
    Gallery.create(
      name: params[:gallery][:name],
      description: params[:gallery][:description]
    )
    redirect_to "/"
  end

  def show
    @gallery = Gallery.find(params[:id])
    render :show
  end
end
