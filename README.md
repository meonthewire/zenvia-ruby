# Zenvia Rest Rails

Ruby API to send sms with Zenvia's REST Api, based on https://github.com/lmorais/zenvia-ruby

### Download and Install
```
gem install zenvia-rest-rails
```

or on your Gemfile:
```
gem "zenvia-rest-rails"
```

and
```
bundle install
```

create zenvia config initializer
```
rails g zenvia:install
```

after config file was created on 'config/initializers/zenvia.rb', you can set your config params:

```ruby

require 'zenvia'

Zenvia.configure do |config|
  config.account  = ENV['ZENVIA_ACCOUNT']
  config.code     = ENV['ZENVIA_CODE']
  config.from     = 'name of message sender. Ex. MY BUSINESS'
  config.callbackOption = 'zenvia callback option. default is NONE'
end

```

### Usage

```ruby

require 'zenvia'

# Sending a SMS

sms = Zenvia::Sms.new('your-sms-id', 'test message!', '5591999999999')

sms.send

```

You can also add two more parameters on 'send' method:

1. schedule_date: String or DateTime
2. aggregateId: String

```ruby

require 'zenvia'

# Sending a SMS with schedule_date and aggregateId

sms = Zenvia::Sms.new('your-sms-id', 'test message!', '5591999999999', '2016-11-22T18:13:00', '111')

sms.send

```

### Send Return

```ruby

{"statusCode"=>"00",
 "statusDescription"=>"Ok",
 "detailCode"=>"000",
 "detailDescription"=>"Message Sent"}

```

For more information about returned codes: http://docs.zenviasmsenus.apiary.io/#introduction/status-table

### Contributing to zenvia-rest-rails

1. Fork the project.
2. Start a feature/bugfix branch.
3. Commit and push until you are happy with your contribution.
4. Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.


See LICENSE.txt for further details.
