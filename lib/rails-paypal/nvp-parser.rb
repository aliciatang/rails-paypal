# parse nave value pair
require 'uri'
require 'httparty/parser'
class NvpParsingIncluded < HTTParty::Parser
    SupportedFormats.merge!({"text/plain" => :nvp})
    protected
    # perform atom parsing on body
    def nvp
      ret = body.split('&').map { |e| e.split('=').map { |v| URI::decode v  }  }
      Hash[*ret.flatten]
    end
end
