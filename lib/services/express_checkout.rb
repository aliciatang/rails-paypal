class RailsPaypal::ExpressCheckout < RailsPaypal
  attr_accessor :params
  attr_accessor :token
  def initialize( line_items )
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
  def set_token(action = 'Sale')
    self.params["PAYMENTREQUEST_0_PAYMENTACTION"] = action
    self.params["METHOD"] = 'SetExpressCheckout'
    response = self.class.call(self.params) 
    response.inspect
    if response["ACK"] == 'Success'
      self.token = response["TOKEN"]
    else
      raise response["L_ERRORCODE0"]+":"+response["L_LONGMESSAGE0"]
    end
  end
end
