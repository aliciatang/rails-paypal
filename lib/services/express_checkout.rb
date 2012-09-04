class RailsPaypal::ExpressCheckout < RailsPaypal
  attr_accessor :params
  attr_accessor :token
  attr_accessor :line_items
  def initialize( line_items )
    self.line_items = line_items
    self.params = {}
    total  = 0.0
    line_items.each_with_index do |li, i|
      self.params["L_PAYMENTREQUEST_0_NAME#{i}"] = li[:name] if li.has_key?(:name)
      self.params["L_PAYMENTREQUEST_0_QTY#{i}"]  = li[:quantity].to_i if li.has_key?(:quantity)
      self.params["L_PAYMENTREQUEST_0_AMT#{i}"]  = li[:price].to_f
      self.params["L_PAYMENTREQUEST_0_DESC#{i}"] = li[:description] if li.has_key?(:description)
      total += (li[:price].to_f * li[:quantity].to_i)
    end
    params["PAYMENTREQUEST_0_AMT"] = total.to_s
  end
  def set(action = 'Sale')
    self.params["PAYMENTREQUEST_0_PAYMENTACTION"] = action
    self.params["METHOD"] = 'SetExpressCheckout'
    response = self.class.call(self.params) 
    if response["ACK"] == 'Success'
      self.token = response["TOKEN"]
    else
      raise response["L_ERRORCODE0"]+":"+response["L_LONGMESSAGE0"]
    end
  end
  def get
    set if self.token.nil?
    self.class.get(self.token)
  end
  def redirect_url
    set if self.token.nil?
    "https://www.sandbox.paypal.com/webscr?cmd=_express-checkout&token=" + self.token
  end
  def self.get(token)
     call({"TOKEN"=>token, "METHOD"=>"GetExpressCheckoutDetails" })
  end

end
