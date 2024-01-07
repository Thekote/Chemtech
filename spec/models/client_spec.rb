require 'rails_helper'

RSpec.describe Client, type: :model do
  describe 'validations' do
    before do
      city = City.create!(name: "City X", state: "XB")
      Client.create!(name: "Client1", sex: "m", age: 30, birthday: 28.years.ago , city_id: city.id)
    end

    it { should validate_presence_of(:name) } 
    
    it { should validate_presence_of(:sex) }

    it { should validate_presence_of(:age) }
    
    it { should validate_numericality_of(:age).is_greater_than(0) } 
    
    it { should belong_to(:city) }
  end

  describe 'scopes' do
    describe '.find_by_name' do
      it 'returns a record with the same name' do
        city = City.create!(name: "City X", state: "XB")
        client = Client.create!(name: "Client1", sex: "m", age: 30, birthday: 28.years.ago , city_id: city.id)
  
        found_by_name = Client.find_by_name("Client1")
        
        expect(found_by_name.first).to eq(client)
      end

      it 'returns nil if no record is found' do
        city = City.create!(name: "City X", state: "XB")
        client = Client.create!(name: "Client1", sex: "m", age: 30, birthday: 28.years.ago , city_id: city.id)

        not_found_client = Client.find_by_name("Client2")

        expect(not_found_client.first).to eq(nil)
      end
    end
  end
end