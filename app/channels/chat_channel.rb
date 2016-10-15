# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ChatChannel < ApplicationCable::Channel

  def subscribed
    stream_from params[:uuid]
  end

  def receive(data)
    was_said = data['message']
    reply = Response.random

    transmit was_said: was_said, reply: reply
  end

end
