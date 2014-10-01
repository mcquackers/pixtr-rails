class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
  end

  def new
    @gallery = Gallery.new
  end

  def create
    #protected from mass assignment until attributes are whitelisted
    gallery = Gallery.create(gallery_params)
    redirect_to gallery_path(gallery)
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    gallery = Gallery.find(params[:id])
    gallery.update(gallery_params)
    redirect_to gallery_path(gallery)
  end

  def destroy
    gallery = Gallery.find(params[:id])
    gallery.destroy
    redirect_to galleries_path
  end

  private
  def gallery_params
    params.require(:gallery).permit(:name, :description)
  end
end
