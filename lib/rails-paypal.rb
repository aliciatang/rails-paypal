require 'httparty'
require 'rails-paypal/nvp-parser'
class RailsPaypal
  include HTTParty
  base_uri "https://api-3t.sandbox.paypal.com/nvp"
  # custom parser must be signed before set the format
  parser NvpParsingIncluded
  # the response format
  format :nvp
#  debug_output # turn on httparty debuy
#  default_timeout 100
#  TODO move thise to a config file 
  URLS = {
    :sandbox => 'api-3t.sandbox.paypal.com/nvp', 
    :production =>'api-3t.paypal.com/nvp',
    :checkout => 'https://www.sandbox.paypal.com/cgi-bin/webscr'
  }
  # wish httparty have something similar for default_params for body data
  PARAMS = {:USER      => 'alicia_1345427347_biz_api1.gmail.com' ,
            :PWD       => '1345427370',
            :SIGNATURE => 'AndYn9Gde1bznDG3gf7QHBhnXR5-A4Xl8tLjtE.ZHgc49RBCg5Yo4RhN',
            :VERSION   => '92.0', # this is the latest version as of Sep 2nd, 2012
            :RETURNURL => 'http://return.com',
            :CANCELURL => 'http://cancel.com'
  }
  
  def self.call(data)
    ret = post('/', :body => PARAMS.merge(data))
    ret.parsed_response
  end
end
require 'services/express_checkout'
