class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate_user!

  def index
    render json: User.all, status: :ok
  end

  def show
    render json: @user, status: :ok
  end

  private

  def set_user
    @user = User.find(params[:id])

  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found
  end
end
