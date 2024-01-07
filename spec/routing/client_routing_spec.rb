require 'rails_helper'

RSpec.describe Api::V1::ClientsController, type: :routing do
  describe 'routing' do
    it { should route(:get, 'api/v1/clients').to(action: :index) }

    it { should route(:get, 'api/v1/clients/1').to(action: :show, id:1) }

    it { should route(:get, 'api/v1/client/name').to(action: :find_name) }

    it { should route(:post, 'api/v1/clients').to(action: :create) }

    it { should route(:put, 'api/v1/client/1').to(action: :update, id:1) }

    it { should route(:delete, 'api/v1/client/1').to(action: :destroy, id:1) }
  end
end