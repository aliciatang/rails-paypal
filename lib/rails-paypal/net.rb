require 'net/http'
require 'net/https'

module Net
  #
  # A convenience class to enable this library to call PayPal's HTTPS NVP APIs
  #
  class HTTPS < HTTP
    def initialize(address, port = nil, verify = :no_verify)
      super(address, port)
      self.use_ssl = true
      self.verify_mode = OpenSSL::SSL::VERIFY_NONE if verify == :no_verify
    end
  end
end
