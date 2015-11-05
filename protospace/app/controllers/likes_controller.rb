class LikesController < ApplicationController

  def create
    # binding.pry
    @prototype = Prototype.find(params[:prototype_id])
    @like = current_user.likes.create(prototype_id: params[:prototype_id])
    # redirect_to @prototype
  end

  def destroy
    # binding.pry
    @prototype = Prototype.find(params[:prototype_id])
    @like = current_user.likes.find_by(prototype_id: @prototype.id)
    @like.destroy
    @likes = Like.where(prototype_id: params[:prototype_id])
    # redirect_to @prototype
  end

end
