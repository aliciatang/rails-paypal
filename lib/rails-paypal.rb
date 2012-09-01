require 'rails'
require 'active_support/dependencies'
require 'net/http'
require 'net/https'
require 'rails-paypal/net'

module RailsPaypal
  # Constants
  ALL = []
  CONTROLLERS = ActiveSupport::OrderedHash.new
  ROUTES = ActiveSupport::OrderedHash.new
end
