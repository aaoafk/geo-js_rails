class CreateIpAddresses < ActiveRecord::Migration[7.1]

  # => Create a unique index on the ip
  def change
    create_table :ip_addresses do |t|
      t.inet :ip
      t.string :area_code
      t.string :country
      t.string :country_code
      t.string :country_code3
      t.string :continent_code
      t.string :city
      t.string :region
      t.string :latitude
      t.string :longitude
      t.integer :accuracy
      t.string :timezone
      t.string :organization_name
      t.integer :asn
      t.string :organization

      t.timestamps
    end
  end

  # ip addresses are unique, right?
  add_index :ip_addresses, :ip, unique: true
end
