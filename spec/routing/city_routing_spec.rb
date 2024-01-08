require 'rails_helper'

RSpec.describe Api::V1::CitiesController, type: :routing do
  describe 'routing' do
    it { should route(:get, 'api/v1/cities').to(action: :index) }

    it { should route(:get, 'api/v1/cities/1').to(action: :show, id:1) }

    it { should route(:get, 'api/v1/city/name').to(action: :find_name) }

    it { should route(:get, 'api/v1/city/state').to(action: :find_state) }

    it { should route(:post, 'api/v1/cities').to(action: :create) }    
  end
end