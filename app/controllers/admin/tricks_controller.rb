class Admin::TricksController < ApplicationController
  def index
    @dog_id = params[:dog_id]
  end

  def destroy
    @trick_id = params[:id]
  end
end
