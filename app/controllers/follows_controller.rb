class FollowsController < ApplicationController
  def create
    stream = Stream.find(params[:id])
    stream.follow(current_user.display_name, current_user.token)
    redirect_to request.referrer
  end

  def destroy
    stream = Stream.find(params[:id])
    stream.unfollow(current_user.display_name, current_user.token)
    redirect_to request.referrer
  end
end
