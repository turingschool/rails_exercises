class TricksController < ApplicationController
  def index
    @dog_id = params[:dog_id]
  end

  def new
    @dog_id = params[:dog_id]
  end

  def create
    @dog_id = params[:dog_id]
    render 'tricks/create'
  end
end
