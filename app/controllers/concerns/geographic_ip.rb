# https://get.geojs.io/v1/ip/geo.json
# https://get.geojs.io/v1/ip/geo/{ip address}.json

module GeographicIp
  extend ActiveSupport::Concern

  included do
    def get_ip_address_info(ip_address:)
      return nil unless ip_address.present?
      begin 
        geo_json_uri = "https://get.geojs.io/v1/ip/geo.json"
        geo_json_uri_ip_address = "https://get.geojs.io/v1/ip/geo/#{ip_address}.json"
        response = HTTP.timeout(5).get(geo_json_uri_ip_address)
      rescue Exception => e
        return nil # No information
      else
        JSON.parse(response.body)
      end
    end
  end
end
