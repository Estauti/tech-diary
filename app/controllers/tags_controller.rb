class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  # GET /tags
  def index
    @tags = Tag.all

    render json: @tags
  end

  # GET /tags/1
  def show
    render json: @tag
  end

  # POST /tags
  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      render json: @tag, status: :created, location: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tags/1
  def destroy
    @tag.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      head(:not_found)
    end

    # Only allow a trusted parameter "white list" through.
    def tag_params
      params.require(:tag).permit(:name)
    end
end
