class ImagesController < ApplicationController
  def show
    @gallery = image_find
    @image = @gallery.images.find(params[:id])
    @comment = Comment.new
    @comments = @image.comments.recent
    @likes = @image.likes
    @groups = current_user.groups
    @tags = Tag.all
  end

  def new
    @gallery = image_find_for_edit
    @image = @gallery.images.new
  end

  def create
    @gallery = image_find_for_edit
    @image = @gallery.images.new(image_params)
    if @image.save
      redirect_to gallery_path(@gallery)
    else
      render :new
    end
  end

  def edit
    @gallery = image_find_for_edit
    @image = @gallery.images.find(params[:id])
  end

  def update
    @gallery = image_find_for_edit
    @image = @gallery.images.find(params[:id])
    if @image.update(image_params)
      redirect_to gallery_image_path(@gallery, @image)
    else
      render :edit
    end
  end

  def destroy
    gallery = image_find_for_edit
    image = gallery.images.find(params[:id])
    image.destroy
    redirect_to gallery_path(gallery)
  end

  private
  def image_params
    params.require(:image).permit(:name, :url, group_ids: [], tag_ids: [])
  end
  def image_find
   Gallery.find(params[:gallery_id])
  end
  def image_find_for_edit
    current_user.galleries.find(params[:gallery_id])
  end
end
