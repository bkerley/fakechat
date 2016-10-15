class ChatsController < ApplicationController
  def index
  end

  def create
    @was_said = params[:chat]
    @reply = Response.order('random()').first.body

    render action: 'index'
  end
end
