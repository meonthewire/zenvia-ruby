# Zenvia Ruby

### Download and Install
```
gem install zenvia-ruby
```

or on your Gemfile:
```
gem "zenvia-ruby"
```

and
```
bundle install
```

create zenvia config initializer
```
rails g zenvia:install
```

after config file created, you should define config params:

```ruby

require 'zenvia'

Zenvia.configure do |config|
  config.account  = 'your-zenvia-account'
  config.code     = 'your-zenvia-code'
  config.dispatch = 'zenvia dispatch method. default is (send)'
  config.from     = 'name of message sender. Eg. MY BUSINESS'
end

```

### Usage

```ruby

require 'zenvia'

# Sending a SMS

sms = Zenvia::Sms.new('test message!', 5521999999999)
sms.forward => #<Net::HTTPOK 200 OK readbody=true>

```


### Contributing to zenvia-ruby

1. Fork the project.
2. Start a feature/bugfix branch.
3. Commit and push until you are happy with your contribution.
4. Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.


Copyright (c) 2012 LEONEL MORAIS. See LICENSE.txt for
further details.
