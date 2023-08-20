class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_user, only: %i[show update destroy]

  def index
    @users = User.all
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
