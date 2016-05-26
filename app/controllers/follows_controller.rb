class FollowsController < ApplicationController
  before_action :require_current_user

  def show
    @streams = Stream.followed(current_user.token)
  end

  def create
    stream = Stream.find(params[:id])
    user = current_user
    stream.follow(user.display_name, user.token)
    redirect_to following_path
  end

  def destroy
    stream = Stream.find(params[:id])
    user = current_user
    stream.unfollow(user.display_name, user.token)
    redirect_to following_path
  end

  private

  def require_current_user
    redirect_to root_path unless current_user
  end
end
