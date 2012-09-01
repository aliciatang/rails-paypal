require './lib/twilio-ruby/version'
Gem::Specification.new do |s|
  s.name        = 'rails-paypal'
  s.version     =  Paypal::VERSION
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
end
