require 'rails_helper'

RSpec.describe LocationController, type: :controller do

  describe "GET 'index'" do
    it 'returns http success' do
      process :index, method: :get
      expect(response).to be_success
    end

    it 'check data' do
      location  = FactoryGirl.create_list(:location, 8)
      loc = location.size
      expect(loc).to eq 8
    end
  end

  describe "POST 'create'" do
    it "create and save new location" do
      post :create, params: {location: {name: 'Test', area: "[[33.46496,-112.04003],[33.46382,-112.1008],[33.4293,-112.10063]]" } }
      expect(response.status).to eq 302
      expect(response.body).to redirect_to(location_index_path)
    end
  end

end