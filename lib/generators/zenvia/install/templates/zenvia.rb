require 'zenvia'

Zenvia.configure do |config|
  config.account  = 'YOUR ZENVIA ACCOUNT'
  config.code     = 'YOUR ZENVIA CODE'
  config.dispatch = 'ZENVIA DISPATCH METHOD'
  config.from     = 'YOUR APPLICATION NAME'
end