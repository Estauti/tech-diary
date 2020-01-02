class DiscoveriesController < ApplicationController
  before_action :set_discovery, only: [:show, :destroy]
  before_action :authenticate_user!

  # GET /discoveries
  def index
    @discoveries = Discovery.all

    @discoveries = @discoveries.where(user_id: params[:user_id]) if params[:user_id]

    render json: @discoveries, status: :ok
  end

  # GET /discoveries/1
  def show
    render json: @discovery
  end

  # POST /discoveries
  def create
    @discovery = Discovery.new(discovery_params)
    @discovery[:user_id] = current_user.id

    if @discovery.save
      render json: @discovery, status: :created
    else
      render json: @discovery.errors, status: :unprocessable_entity
    end
  end

  # DELETE /discoveries/1
  def destroy
    @discovery.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discovery
      @discovery = Discovery.find(params[:id])

    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end

    # Only allow a trusted parameter "white list" through.
    def discovery_params
      params.require(:discovery).permit(:text, :user_id)
    end
end
