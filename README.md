# SerializeYaml2json

[![Gem Version](https://badge.fury.io/rb/serialize_yaml2json.png)](http://badge.fury.io/rb/serialize_yaml2json)
[![Code Climate](https://codeclimate.com/github/supremegolf/serialize_yaml2json.png)](https://codeclimate.com/github/supremegolf/serialize_yaml2json)
[![Build Status](https://travis-ci.org/supremegolf/serialize_yaml2json.svg?branch=master)](https://travis-ci.org/supremegolf/serialize_yaml2json)

ActiveRecord::Coder to transition serialized attributes from YAML to JSON.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'serialize_yaml2json'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install serialize_yaml2json

## Usage

Update your models to use this Coder.

    class Widget < ActiveRecord::Base
      # serialize :data
      serialize :data, SerializeYAML2JSON::Coder
    end

## Contributing

1. Fork it ( https://github.com/supremegolf/serialize_yaml2json/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
