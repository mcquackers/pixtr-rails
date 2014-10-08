class LikesController < ApplicationController
  def create
    @image = Image.find(params[:image_id])
    current_user.like(@image)
    redirect_to gallery_image_path(@image.pass_gallery, @image)
  end

  def destroy
    @image = Image.find(params[:image_id])
    Like.where("image_id = '#{@image.id}' AND user_id = '#{current_user.id}'").destroy_all
    redirect_to gallery_image_path(@image.pass_gallery, @image)
  end
end
