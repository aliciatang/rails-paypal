require 'test_helper'

class ExpressCheckoutTest < Test::Unit::TestCase
	def test_set_success
		ret = RailsPaypal::ExpressCheckout.new([{:name=>'item 1',:price=>'5.0',:quantity=> 4}])
        assert_nothing_raised do
            ret.set
        end
		assert ret.token
	end
	def test_set_fail
		ret =RailsPaypal::ExpressCheckout.new([{:name=>'item 1',:price=>'5.0',:quantity=> -4}])
		assert_raise  RuntimeError do
		  ret.set
		end
		assert_nil ret.token
	end
	def test_get_success
		ret = RailsPaypal::ExpressCheckout.new([{:name=>'item 1',:price=>'5.0',:quantity=> 4}])
    assert_nothing_raised do
      ret = ret.get
    end
    assert_not_nil ret["CHECKOUTSTATUS"]
	end
	def test_get_redirect_url
		ret = RailsPaypal::ExpressCheckout.new([{:name=>'item 1',:price=>'5.0',:quantity=> 4}])
    assert_not_nil ret.redirect_url
	end
  def test_do_payment
    ret = RailsPaypal::ExpressCheckout::do('EC-3EC18176EP034311U','TPCS2TXJU979S', '20.00')
    assert_not_nil ret
  end
end
