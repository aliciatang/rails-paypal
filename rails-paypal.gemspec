# -*- encoding: utf-8 -*-
require File.expand_path("../lib/rails-paypal/version", __FILE__)
Gem::Specification.new do |s|
  s.name        = 'rails-paypal'
  s.version     =  RailsPaypal::VERSION
  s.date        = '2012-08-31'
  
  s.summary     = "Paypal for rails"
  s.description = "A simple paypal client for rails lovers and paypal haters!"
  s.author      = "Alicia Tang"
  s.email       = 'alicia.x.tang@gmail.com'
  s.license     = 'MIT'
  

  s.require_paths = %w[lib]
  s.files = `git ls-files`.split("\n")

  s.homepage    =
    'https://github.com/aliciatang/rails-paypal'

  s.extra_rdoc_files = ['README.md']
  
  # dependency
  s.add_dependency('httparty')
end
