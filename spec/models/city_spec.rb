require 'rails_helper'

RSpec.describe City, type: :model do
  describe 'validations' do
    subject { City.create!(name: "City Z", state: "ZA") }

    it { should validate_presence_of(:name) } 
    
    it { should validate_presence_of(:state) }
    
    it { should validate_length_of(:state).is_equal_to(2) }

    it { should have_many(:clients) }
  end

  describe 'scopes' do
    describe '.find_by_state' do
      it 'finds records with the same state' do
        city =  City.create!(name: "City Z", state: "ZA")
  
        found_by_state = City.find_by_state("ZA")
        
        expect(found_by_state.first).to eq(city)
      end
      
      it 'returns an empty array if no record is found' do
        city =  City.create!(name: "City Z", state: "ZA")

        not_found_city = City.find_by_state("PB")

        expect(not_found_city).to eq([])
      end
    end

    describe '.find_by_name' do
      before do 
        City.create!(name: "City Z", state: "ZA")
      end

      it 'returns a record with the same name' do
        found_by_name = City.find_by_name("City Z")
  
        expect(found_by_name.first).to have_attributes(:name => "City Z")
      end

      it 'returns nil if no record is found' do
        not_found_city = City.find_by_name("City A")

        expect(not_found_city.first).to eq(nil)
      end
    end
  end
end
