class IpAddressesController < ApplicationController
  include GeographicIp

  # GET /ip_addresses
  def index
    @ip_addresses = IpAddress.all

    render json: @ip_addresses, status: :ok
  end

  # GET /ip_addresses/1
  def show
    render json: @ip_address
  end

  # POST /ip_addresses
  def create
    unless ip_address_params[:ip].present?
      render json: { error: "ip address not provided"}, status: :bad_request
    end

    @ip_address = get_ip_address_info(ip_address: ip_address_params[:ip])

    if @ip_address.has_key? :error
      render json: @ip_address, status: :gateway_timeout and return
    end

    @new_ip_address_record = IpAddress.new @ip_address
    if @new_ip_address_record.save
      render json: @new_ip_address_record, status: :created, location: @new_ip_address_record
    else
      render json: @new_ip_address_record.errors, status: :unprocessable_entity
    end
  end

  def filter
    query_by = filter_params
    @filtered_ip_addresses = IpAddress.filter_ip_addresses_by_country_code(query_by[:country_code]).filter_ip_addresses_by_city(query_by[:city])
    render json: @filtered_ip_addresses, status: :ok
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  # Only allow a list of trusted parameters through.
  def ip_address_params
    params.require(:ip_address).permit(:ip)
  end

  def filter_params
    params.require(:filter_params).permit(:country_code, :city)
  end
end
