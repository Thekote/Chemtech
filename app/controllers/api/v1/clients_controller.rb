class Api::V1::ClientsController < Api::BaseController
  def index
    @clients = Client.all
    render json: @clients
  end

  def show
    @client = Client.find(params[:id])

    return render json: @client.errors, status: :not_found unless @client
    render json: @client, status: :ok
  end

  def create
    @client = Client.new(client_params)

    return render json: @client.errors, status: :unprocessable_entity unless @client.save
    render json: @client, status: :created
  end

  def update
    @client = Client.find(params[:id])

    return render json: @client.errors, status: :not_found unless @client.update!(client_params)
    render json: @client, status: :ok
  end

  def destroy
    @client = Client.find(params[:id])

    return render json: @client.errors, status: :not_found unless @client.destroy!
    render json: @client, status: :no_content
  end

  def find_name
    data = JSON.parse(request.body.read)
    name = data['name']
    @client = Client.find_by_name(name)

    return render json: "Client not found", status: :not_found unless @client.any?
    render json: @client.first, status: :ok
  end

  private
  def client_params
    params.require(:client).permit(:name, :sex, :birthday, :age, :active, :city_id)
  end
end
