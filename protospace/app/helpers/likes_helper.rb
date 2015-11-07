module LikesHelper
  def user_like
    current_user.likes
  end
end
