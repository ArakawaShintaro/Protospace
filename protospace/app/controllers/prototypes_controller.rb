class PrototypesController < ApplicationController
  def index
  end

  def show
    @prototype = Prototype.find(id_params[:id])
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
  end

  def edit
    @prototype = Prototype.find(id_params[:id])
  end

  def update
    @prototype = Prototype.find(id_params[:id])
    if @prototype.update(prototype_params)
      redirect_to :root, notice: 'プロトタイプを更新しました'
    else
      render :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    if prototype.user_id == current_user.id
      prototype.destroy
      redirect_to :root, notice: 'プロトタイプを削除しました'
    end
  end


  private

  def prototype_params
    params.require(:prototype).permit(
      :catchcopy,
      :concept,
      :user_id,
      :title,
      images_attributes: [:id, :image, :status]
      ).merge(user_id: current_user.id)
  end

  def id_params
    params.permit([:id])
  end
end
