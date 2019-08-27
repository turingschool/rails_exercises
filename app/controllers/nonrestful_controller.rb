class NonrestfulController < ApplicationController
  def hello
  end

  def what_is_your_name
    @name = params[:name]
  end

  def deactivate
    @item_id = params[:the_item_id]
  end

  def subtract
    x = params[:x].to_i
    y = params[:y].to_i
    @answer = y - x
  end
end
