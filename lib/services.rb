module DFP
  class Service
    require 'pp'
    require './rails-paypal/net'
    class << self
      
      def debugging=(val)
      end
      def make_nvp_call(params)
        pp params if self.debugging

        @api_parameters.merge! params
        @api_parameters.update(@api_parameters){ |key,val| val.to_s }
        response = Net::HTTPS.post_form(URI("https://#{ @paypal_url }"), @api_parameters)
        response.error! unless response.kind_of? Net::HTTPSuccess
        PayPalResponse.new.merge get_hash(response.body)
      end
      
    end
  end
end

require 'lib/services/express_checkout'
# Website Payments Pro
# Mass Payment
