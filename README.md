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

Step Tree: hope your user finish the payment on paypal site.

If they do, they will be redirected to the return_url you specified in step one with two parameters: token and PayerID

    your_return_url/?token=EC-3EC18176EP034311U&PayerID=TPCS2TXJU979S

In the controller for the above url, now is the time for you to capture the $$. That's all it is about, isn't it?

    ec.do
    # or use the static method
    RailsPaypal::ExpressCheckout.do("YOURTOKEN")
    

Step Four: There is no step 4! How nice is that!

----------
Hand on there, you cautch me! Yes, in step 3 I have an if condition but no else. Which is pretty bad!
If you only care about the case you got the money, there is nothing you need to do. 
No action is not a bad action to take.
In case you do wanna be noticed when the user abandon the cart or at lease log it. There another url you passed to paypay in step 1 when setting up express checkout.
And we could do something about it.

A little bit more accurate.
Verify payment info by calling the get method to get what the actual amount was paid.
And of course you can get invoice id you specified in step one as well so you know which order you should mark as paid and deliver just in case you did not pass the order id in the return_url already.

    ec.get
    # or use the static method
    RailsPaypal::ExpressCheckout.get("YOURTOKEN")


    

