class Api::V1::CitiesController < Api::BaseController
  def index
    @cities = City.all
    render json: @cities
  end

  def show
    @city = City.find(params[:id])

    return render json: @city.errors, status: :not_found unless @city
    render json: @city, status: :ok
  end

  def create
    @city = City.new(city_params)

    return render json: @city.errors, status: :unprocessable_entity unless @city.save
    render json: @city, status: :created
  end

  def find_name
    data = JSON.parse(request.body.read)
    value = data['name']
    @city = City.find_by_name(value)

    return render json: "City not found", status: :not_found unless @city.any?
    render json: @city.first, status: :ok

  end

  def find_state
    data = JSON.parse(request.body.read)
    value = data['state']
    @cities = City.find_by_state(value)

    return render json: "City not found", status: :not_found unless @cities
    render json: @cities, status: :ok
  end

  private
  def city_params
    params.require(:city).permit(:name, :state)
  end
end
