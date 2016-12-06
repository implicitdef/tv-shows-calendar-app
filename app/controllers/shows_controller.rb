class ShowsController < ActionController::API
  rescue_from ActiveRecord::RecordNotUnique do |e|
    render json: { message: "Duplicated record"}, :status => 409
  end

  def all
    render json: Show.all
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
