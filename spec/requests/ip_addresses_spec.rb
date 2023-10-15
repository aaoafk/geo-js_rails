require 'rails_helper'

RSpec.describe "/ip_addresses", type: :request do
  describe "GET /index" do
    it "renders a successful response" do
      get ip_addresses_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      ip_address = IpAddress.first
      get ip_address_url(ip_address), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new IpAddress" do
        expect {
          post ip_addresses_url,
               params: { ip_address: { ip: "8.8.8.8" }},
               as: :json
        }.to change(IpAddress, :count).by(1)
      end

      it "renders a JSON response with the new ip_address" do
        post ip_addresses_url,
             params: { ip_address: { ip: "8.8.8.8" }},
             as: :json
        
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "GET /filter" do
    it "filters ip addresses as expected" do
      # Simulate the values you want to filter by
      country_code_value = 'NZ'
      city_value = 'North Damien'

      # Make the API request to filter ip addresses
      get filter_ip_addresses_url, params: {
            filter_params: { country_code: country_code_value, city: city_value }
          }, as: :json
    
      json_response = JSON.parse(response.body)
    
      # Get the count from the database directly using the scopes or ActiveRecord query
      expected_count = IpAddress.filter_ip_addresses_by_country_code(country_code_value).filter_ip_addresses_by_city(city_value).count
    
      # Compare the two counts
      expect(json_response.size).to eq(expected_count)
    end
  end
end
