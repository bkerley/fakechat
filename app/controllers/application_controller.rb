class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_client_id

  def set_client_id
    return client_id = cookies.signed[:client_id] if cookies.signed[:client_id]

    client_id = cookies.signed[:client_id] = SecureRandom.uuid
  end
end
