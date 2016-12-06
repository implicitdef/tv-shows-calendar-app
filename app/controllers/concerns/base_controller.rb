
module BaseController
  extend ActiveSupport::Concern

  included do
    include DeviseTokenAuth::Concerns::SetUserByToken
    rescue_from ActiveRecord::RecordNotUnique do |e|
      render json: { message: "Duplicated record"}, :status => 409
    end
  end

  def require_feed_key!
    if params[:key].nil? || params[:key] != Rails.application.secrets.feed_api_key
      render json: {msg: "Please provide the correct key for this endpoint"}, status: 401
    end
  end


end