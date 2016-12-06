class SeasonsController < ActionController::API
  rescue_from ActiveRecord::RecordNotUnique do |e|
    render json: { message: "Duplicated record"}, :status => 409
  end

  def all
    show = Show.find(params[:id])
    render json: show.seasons
  end

  def get
    show = Show.find(params[:id])
    season = show.seasons.find_by!(number: params[:number])
    render json: season
  end

  def create
    show = Show.find(params[:id])
    show.seasons.create!(season_params)
  end

  def update
    show = Show.find(params[:id])
    season = show.seasons.find_by!(number: params[:number])
    season.update!(season_params)
  end

  def delete
    show = Show.find(params[:id])
    season = show.seasons.find_by!(number: params[:number])
    season.destroy
  end

  private
  def season_params
    params.require(:season).permit(:number, :start_date, :end_date)
  end

end
