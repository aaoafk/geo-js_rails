# https://get.geojs.io/v1/ip/geo.json
# https://get.geojs.io/v1/ip/geo/{ip address}.json

module GeographicIp
  extend ActiveSupport::Concern

  included do
    def get_ip_address_info(ip_address:)
      return nil unless ip_address.present?

      geo_json_uri = "https://get.geojs.io/v1/ip/geo.json"
      geo_json_uri_ip_address = "https://get.geojs.io/v1/ip/geo/#{ip_address}.json"
      begin 
        response = HTTP.timeout(5).get(geo_json_uri_ip_address)
      rescue Exception => e
        return { error: e } 
      else
        if response.status == 200
          return JSON.parse(response.body)
        else
          return { error: "#{response.status} request could not be completed" }
        end
      end
    end
  end
end
