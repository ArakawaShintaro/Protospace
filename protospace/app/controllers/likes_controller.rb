class LikesController < ApplicationController
  before_action :set_prototype, only: [:create, :destroy]

  def create
    @like = current_user.likes.create(prototype_id: params[:prototype_id])
  end

  def destroy
    @like = current_user.likes.find_by(prototype_id: @prototype.id)
    @like.destroy
    # @likes = Like.where(prototype_id: params[:prototype_id])
  end

  private
  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end

end
