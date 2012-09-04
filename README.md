rails-paypal
============

A simple paypal client for *rails lovers* and *paypal haters*!


Install
-------
Since this is pre-alpha right now, I did not updage the builded gem, so just add it your Gemfile and point to github here.

    gem 'rails-paypal', :git => 'git://github.com/aliciatang/rails-paypal.git'
    bundle update

Call Paypal
-----------
Make a call the paypal endpoint with what every parameters you need.

    RailsPaypal.call({ :METHOD => 'SetExpressCheckout', :PAYMENTREQUEST_0_AMT=>'300.0'})

The above call will return

    {"TOKEN"=>"EC-41U99669P1884934P", "TIMESTAMP"=>"2012-09-03T04:59:14Z", "CORRELATIONID"=>"5d061f72f2cd4", "ACK"=>"Success", "VERSION"=>"92.0", "BUILD"=>"3622349"}

Express Checkout
----------------
I am working on express checkout now. Due the urgliness of paypay documentations, I will try to write a little bit more and summarize them.

Step One: get token

     # create the express checkout service instance with a list of line-item details
     ec =  RailsPaypal::ExpressCheckout.new([{:name=>'item 1',:price=>'5.0',:quantity=> 4, :description => "This is optional"}])
     # call paypal for a toke
     ec.set

Step Two: rediret the end user to paypal
     
     # you can call this directly without calling set first since it will check for the token
     # But you do need to pass the list of line items to the construtor, since we need to call paypal for the token
     ec.redirect_url

Step Tree: hope your user finishe the payment in paypal site.

If they do, they may or may not click the back to store button on paypay, so better not bet on that. 
So from what I have read, IPN could be the way out to know if they paid. And if they do, you can start diliver your product now.



