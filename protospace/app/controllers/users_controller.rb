class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]

  def show
    @prototypes = @user.prototypes.page(params[:page]).per(8).eager_load(:tags)
  end

  def edit
  end

  def update
    if current_user.update(update_params)
      redirect_to user_path(current_user), notice: 'プロフィールを編集しました'
    else
      render :edit
    end
  end

  private
  def update_params
    params.require(:user).permit(:name, :password, :works, :profile, :avatar, :member)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
