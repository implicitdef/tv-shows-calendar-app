class ApplicationController < ActionController::API
  include BaseController

  def hello
    render json: {key: Rails.application.secrets.feed_api_key}
  end


end

