rails-paypal
============

A simple paypal client for rails lovers and paypal haters!

Install
-------
    gem 'rails-paypal', :git => 'git://github.com/aliciatang/rails-paypal.git'
    bundle update

Call Paypal
-----------
    RailsPaypal.call({ :METHOD => 'SetExpressCheckout', :PAYMENTREQUEST_0_AMT=>'300.0'})

the above call will return

    {"TOKEN"=>"EC-41U99669P1884934P", "TIMESTAMP"=>"2012-09-03T04:59:14Z", "CORRELATIONID"=>"5d061f72f2cd4", "ACK"=>"Success", "VERSION"=>"92.0", "BUILD"=>"3622349"}
