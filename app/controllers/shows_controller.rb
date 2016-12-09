class ShowsController < ActionController::API
  include BaseController
  before_action :require_feed_key!, except: [:search, :get]

  def search
    name = params[:q]
    if name.nil?
      render json: Show.all
    else
      render json: Show.where('LOWER(name) LIKE ?', "%#{name.downcase}%").limit(10)
    end
  end

  def get
    render json: Show.find(params[:id])
  end

  def create
    Show.create!(show_params)
  end

  def update
    show = Show.find(params[:id])
    show.update!(show_params)
  end

  def delete
    Show.find(params[:id]).destroy
  end

  private
  def show_params
    params.require(:show).permit(:name, :id)
  end

end
