class ApplicationController < ActionController::API
  include BaseController
  before_action :require_feed_key!, only: [:secure]

  def hello
    render json: {key: Rails.application.secrets.feed_api_key}
  end

  def secure
    render json: {key: Rails.application.secrets.feed_api_key}
  end

end

