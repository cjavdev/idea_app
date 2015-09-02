class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(params[:user])

    if @user
      login(@user)
      render json: @user
    else
      render json: ["invalid email/password combo"], status: 422
    end
  end

  def destroy
    logout
    render json: {}
  end
end
