class PrototypesController < ApplicationController
  def index
  end

  def show
    @prototype = Prototype.find(params[:id])
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

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    prototype = Prototype.find(params[:id])
    if prototype.user_id == current_user.id
      prototype.update(prototype_params)
    end

    redirect_to :root, notice: 'プロトタイプを更新しました'
  end

  def destroy
    prototype = Prototype.find(params[:id])
    if prototype.user_id == current_user.id
      prototype.destroy
    end

    redirect_to :root, notice: 'プロトタイプを削除しました'
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
end
