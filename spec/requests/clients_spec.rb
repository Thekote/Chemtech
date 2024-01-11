require 'rails_helper'

RSpec.describe 'api/v1/clients', type: :request do
  let(:city) do
    City.create(name: "City Y", state: "XY")
  end

  let(:valid_attributes) do
    {
      name: "Client1", 
      sex: "m", 
      age: 30, 
      birthday: 28.years.ago,
      city_id: city.id
    }
  end

  let(:invalid_attributes) do
    {
      sex: "m", 
      age: 30, 
      birthday: 28.years.ago,
      city_id: city.id
    }
  end

  describe 'GET index' do
    it 'it renders a successful response' do
      Client.create! valid_attributes

      get api_v1_clients_path

      expect(response).to be_successful
    end
  end

  describe 'GET show' do
    it 'it renders a successful response' do
      client = Client.create! valid_attributes

      get api_v1_clients_path(client.id)

      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST create' do
    context 'with valid parameters' do
      it 'it creates a new client' do
       expect do
         post  api_v1_client_create_path, params: { client: valid_attributes }
       end.to change(Client, :count).by(1)
      end

      it 'renders a successful response' do
        post  api_v1_client_create_path, params: { client: valid_attributes }

        expect(response).to be_successful
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      it 'does not creates a new client' do
        expect do
          post  api_v1_client_create_path, params: { client: invalid_attributes }
        end.to change(Client, :count).by(0)
      end

      it 'renders a unsuccessful response' do
        post  api_v1_client_create_path, params: { client: invalid_attributes }

        expect(response).to_not be_successful
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH update' do
      let(:new_attibutes) do
        {
          name: "Pedro Ganso"
        }
      end

      it 'updates the client' do
        client = Client.create! valid_attributes

        patch "/api/v1/client/#{client.id}", params: { client: new_attibutes}
        client.reload

        expect(client.name).to eq("Pedro Ganso")
      end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested client' do
      client = Client.create! valid_attributes
      expect do
        delete "/api/v1/client/#{client.id}"
      end.to change(Client, :count).by(-1)
    end
  end

  describe 'POST find_name' do
    it 'it renders a successful response' do
      client = Client.create! valid_attributes
      body = { name: "Client1" }

      post api_v1_client_name_path, params: body, as: :json

      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
  end
end