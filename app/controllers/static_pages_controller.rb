class StaticPagesController < ApplicationController
  def welcome
  end

  def root
    redirect_to "/welcome" unless logged_in?
  end
end
