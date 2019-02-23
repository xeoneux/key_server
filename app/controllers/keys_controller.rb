class KeysController < ApplicationController
  before_action :set_key, only: [:show, :update, :destroy]

  # GET /keys
  def index
    @keys = Key.all

    render json: @keys
  end

  # GET /keys/1
  def show
    render json: @key
  end

  # POST /keys E1 - Generate Keys
  def create
    @key = Key.new()

    if @key.save
      render json: @key, status: :created, location: @key
    else
      render json: @key.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /keys/1
  def update
    if @key.update(key_params)
      render json: @key
    else
      render json: @key.errors, status: :unprocessable_entity
    end
  end

  # DELETE /keys/1
  def destroy
    @key.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_key
      @key = Key.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def key_params
      params.require(:key).permit(:blocked)
    end
end
