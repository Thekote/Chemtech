require 'rails_helper'

RSpec.describe 'api/v1/cities', type: :request do
  let(:valid_attributes) do
    {
      name: "City Y",
      state: "XY"
    }
  end

  let(:invalid_attributes) do
    {
      name: "City Y"
    }
  end

  describe 'GET index' do
    it 'it renders a successful response' do
      City.create! valid_attributes

      get api_v1_cities_path

      expect(response).to be_successful
    end
  end

  describe 'GET show' do
    it 'it renders a successful response' do
      city = City.create! valid_attributes

      get api_v1_cities_path(city.id)

      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST create' do
    context 'with valid parameters' do
      it 'it creates a new city' do
       expect do
         post api_v1_city_create_path, params: { city: valid_attributes }
       end.to change(City, :count).by(1)
      end

      it 'renders a successful response' do
        post api_v1_city_create_path, params: { city: valid_attributes }

        expect(response).to be_successful
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      it 'does not creates a new city' do
        expect do
          post api_v1_city_create_path, params: { city: invalid_attributes }
        end.to change(City, :count).by(0)
      end

      it 'renders a unsuccessful response' do
        post api_v1_city_create_path, params: { city: invalid_attributes }

        expect(response).to_not be_successful
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET find_name' do
    it 'it renders a successful response' do
      city = City.create! valid_attributes
      body = { name: "City Y" }

      get api_v1_city_name_path, params: body, as: :json

      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET find_state' do
    it 'it renders a successful response' do
      city = City.create! valid_attributes
      body = { state: "XY" }

      get api_v1_city_state_path, params: body, as: :json

      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
  end
end