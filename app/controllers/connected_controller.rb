class ConnectedController < ActionController::API
  include BaseController
  before_action :authenticate_user!


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
