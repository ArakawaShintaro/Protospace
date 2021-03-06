class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]

  def show
    @comment = Comment.new(prototype_id: @prototype)
    @like = Like.find_by(prototype_id: @prototype.id)
    @tags = @prototype.tag_list
  end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to @prototype, notice: 'プロトタイプを保存しました'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to :root, notice: 'プロトタイプを更新しました'
    else
      render :edit
    end
  end

  def destroy
    if @prototype.user_id == current_user.id
      @prototype.destroy
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
      ).merge(user_id: current_user.id, tag_list: params[:tag_list])
  end

  def set_prototype
    @prototype = Prototype.eager_load(comments: [:user]).find(params[:id])
  end

end
