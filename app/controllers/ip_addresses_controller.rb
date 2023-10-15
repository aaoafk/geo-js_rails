class IpAddressesController < ApplicationController
  include GeographicIp
  before_action :set_ip_address, only: %i[ show update destroy ]

  # GET /ip_addresses
  def index
    @ip_addresses = IpAddress.all

    render json: @ip_addresses
  end

  # GET /ip_addresses/1
  def show
    render json: @ip_address
  end

  # POST /ip_addresses
  def create
    @ip_address = get_ip_address_info(ip_address: ip_address_params)

    if @ip_address.save
      render json: @ip_address, status: :created, location: @ip_address
    else
      render json: @ip_address.errors, status: :unprocessable_entity
    end
  end

  def filter
    query_by = filter_params
    @filtered_ip_addresses = IpAddress.filter_ip_address_by_country_code(query_by[:country_code]).filter_ip_addresses_by_city(query_by[:city])
    render json: @filtered_ip_addresses
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_ip_address
    @ip_address = IpAddress.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def ip_address_params
    params.require(:ip_address).permit(:ip)
  end

  def filter_params
    params.require(:filter_params).permit(:country_code, :city)
  end
end
