class ConnectedController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotUnique do |e|
    render json: { message: "Duplicated record"}, :status => 409
  end


  def followed_shows
    render json: current_user.shows
  end

  def follow_show
    current_user.shows << Show.find(params[:id])
  end

  def unfollow_show
    current_user.shows.delete(Show.find(params[:id]))
  end






end
