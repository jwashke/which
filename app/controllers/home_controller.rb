class HomeController < ApplicationController
  def show
    @streams = Stream.featured
  end
end
