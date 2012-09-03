require 'test_helper'

class ExpressCheckoutTest < Test::Unit::TestCase
	def test_call_success
		ret =RailsPaypal::ExpressCheckout.new([{:name=>'item 1',:price=>'5.0',:quantity=> 4}])
        assert_nothing_raised do
            ret.set_token
        end
		assert ret.token
	end
	def test_call_fail
		ret =RailsPaypal::ExpressCheckout.new([{:name=>'item 1',:price=>'5.0',:quantity=> -4}])
		assert_raise  RuntimeError do
		  ret.set_token
		end
		assert_nil ret.token
	end
end