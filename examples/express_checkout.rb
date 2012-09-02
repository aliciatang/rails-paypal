dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'rails-paypal')
@data =  {
  :METHOD => 'SetExpressCheckout', 
  :PAYMENTREQUEST_0_AMT=>'300.0',
  :PAYMENTREQUEST_0_PAYMENTACTION => 'Sale',
  :PAYMENTREQUEST_0_ITEMAMT=>'300.0',
  :L_PAYMENTREQUEST_0_NAME0=>'Item 1',
  :L_PAYMENTREQUEST_0_QTY0=>'1',
  :L_PAYMENTREQUEST_0_AMT0=>'100.00',
  :L_PAYMENTREQUEST_0_NAME1=>'Item 2',
  :L_PAYMENTREQUEST_0_QTY1=>'4',
  :L_PAYMENTREQUEST_0_AMT1=>'50.0'
}

RailsPaypal.call(@data)
