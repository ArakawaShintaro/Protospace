class PrototypesController < ApplicationController
  def index
  end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to :root, notice: 'プロトタイプを保存しました'
    else
      render :new
    end
    # Prototype.create(prototype_params)
    # redirect_to :root
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
