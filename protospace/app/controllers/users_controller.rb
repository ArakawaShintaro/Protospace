class UsersController < ApplicationController
  def show
    @user = User.find(id_params[:id])
    @prototypes = @user.prototypes
  end

  def edit
    @user = User.find(id_params[:id])
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

  def id_params
    params.permit(:id)
  end
end
