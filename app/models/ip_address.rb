class IpAddress < ApplicationRecord
# app/models/ip_address.rb
  scope :filter_ip_addresses_by_country_code, -> (country_code) { where(country_code: country_code) }
  scope :filter_ip_addresses_by_city, -> (city) { where(city: city) }
end
