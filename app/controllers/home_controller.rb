class HomeController < ApplicationController
  def show
    @streams = Stream.followed(current_user.token) if current_user
    @streams = Stream.featured if current_user.nil?
  end
end
