FactoryBot.define do
  factory :ip_address do
    sequence(:id) { |n| n }
    ip { [Faker::Internet.ip_v4_address, Faker::Internet.ip_v6_address].sample }
    area_code { Faker::Address.zip_code }
    country { Faker::Address.country }
    country_code { Faker::Address.country_code }
    country_code3 { Faker::Address.country_code_long }
    continent_code { ["AF", "AN", "AS", "EU", "NA", "OC", "SA"].sample }
    city { Faker::Address.city }
    region { Faker::Address.state }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    sequence(:accuracy) { |n| n }
    timezone { Faker::Address.time_zone }
    organization_name { Faker::Company.name }
    sequence(:asn) { |n| n }
    organization { Faker::Company.name }
    created_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    updated_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
  end
end
