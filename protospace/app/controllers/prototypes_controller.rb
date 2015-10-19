class PrototypesController < ApplicationController
  def index
  end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def create
    Prototype.create(prototype_params)
    redirect_to action: :index
  end


  private

  def prototype_params
    params.require(:prototype).permit(
      :catchcopy,
      :concept,
      :user_id,
      :title,
      images_attributes: [:id, :image, :status, :prototype_id]
      )
    end
end
