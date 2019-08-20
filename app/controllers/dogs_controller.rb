class DogsController < ApplicationController
  def index
  end

  def show
    @dog_id = params[:id]
  end

  def new
  end

  def edit
    @dog_id = params[:id]
  end

  def create
    render "dogs/create"
  end

  def update
    @dog_id = params[:id]
    render "dogs/update"
  end

  def destroy
    @dog_id = params[:id]
    render "dogs/destroy"
  end
end
