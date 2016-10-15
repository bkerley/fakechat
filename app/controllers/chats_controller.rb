class ChatsController < ApplicationController
  def index
    @uuid = SecureRandom.uuid
  end

  def create
    @was_said = params[:chat]
    @reply = Response.random

    render action: 'index'
  end
end
