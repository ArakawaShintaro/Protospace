class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @prototypes = @user.prototypes
  end

  def edit
  end

  def update
    current_user.update(update_params)
    redirect_to :root
  end

  private
  def update_params
    params.require(:user).permit(:name, :password, :works, :profile, :avatar, :member)
  end
end
