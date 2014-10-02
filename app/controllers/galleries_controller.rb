class GalleriesController < ApplicationController
  def index
    @galleries = current_user.galleries
  end

  def new
    @gallery = current_user.galleries.new
  end

  def create
    #protected from mass assignment until attributes are whitelisted
    @gallery = current_user.galleries.create(gallery_params)
    if @gallery.save
      redirect_to gallery_path(@gallery)
    else
      render :new
    end
  end

  def show
    @gallery = gallery_find
  end

  def edit
    @gallery = gallery_find
  end

  def update
    @gallery = gallery_find
    if @gallery.update(gallery_params)
      redirect_to gallery_path(@gallery)
    else
      render :edit
    end
  end

  def destroy
    gallery = gallery_find
    gallery.destroy
    redirect_to galleries_path
  end

  private
  def gallery_params
    params.require(:gallery).permit(:name, :description)
  end
  def gallery_find
    current_user.galleries.find(params[:id])
  end
end
