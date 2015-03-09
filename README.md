# Timeloop [![Code Climate](https://codeclimate.com/github/pinoss/timeloop.png)](https://codeclimate.com/github/pinoss/timeloop) [![Build Status](https://travis-ci.org/pinoss/timeloop.svg?branch=master)](https://travis-ci.org/pinoss/timeloop) [![Coverage Status](https://coveralls.io/repos/pinoss/timeloop/badge.png?branch=master)](https://coveralls.io/r/pinoss/timeloop?branch=master) [![Gem Version](https://badge.fury.io/rb/timeloop.svg)](http://badge.fury.io/rb/timeloop)

Timeloop is a simple Ruby gem that provides loop with time interval inspired on 'every' method from whenever gem.

## Installation

Add this line to your application's Gemfile:

    gem 'timeloop'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install timeloop

## Usage

Require gem in you Ruby file:

```ruby
require 'timeloop'

Timeloop.every 10.seconds do
  puts '10 seconds delay'
end

# Result:

# 10 seconds delay
# 10 seconds delay
# 10 seconds delay
# ...

Timeloop.every 3.hours do
  Mail.deliver do
    from    'me@test.email'
    to      'you@test.email'
    subject '1 hour message'
    body    'Hi, you will get that message every hour. Be prepared!'
  end
end

Timeloop.every :minute do
  product = 2 * 2
  puts "and 2 * 2 is still #{product}"
end

# Result:

# and 2*2 is still 4
# and 2*2 is still 4
# and 2*2 is still 4
# ...
```

You can also specify how many times your block will be evaluated:

```ruby
Timeloop.every 10.seconds, maximum: 4.times do |i|
 puts i
end

# Result:

# 0
# 1
# 2
# 3
# => 4

Timeloop.every 'second', maximum: 3 do |i|
 puts 'You will see me only 3 times.'
end

# Result:

# You will see me only 3 times.
# You will see me only 3 times.
# You will see me only 3 times.
# => 3
```

If you want to include the `every` method in your own classes simply
include the `Timeloop::Helper` module.

```ruby
class MyClass
  include Timeloop::Helper

  def doit
    every 10.seconds, max: 4 do |i|
      puts i
    end
  end
end
```

## Contributing

1. Fork it ( https://github.com/pinoss/timeloop/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
