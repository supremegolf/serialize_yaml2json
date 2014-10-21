# SerializeYAML2JSON

[![Gem Version](https://badge.fury.io/rb/serialize_yaml2json.png)](http://badge.fury.io/rb/serialize_yaml2json)
[![Code Climate](https://codeclimate.com/github/supremegolf/serialize_yaml2json.png)](https://codeclimate.com/github/supremegolf/serialize_yaml2json)
[![Build Status](https://travis-ci.org/supremegolf/serialize_yaml2json.svg?branch=master)](https://travis-ci.org/supremegolf/serialize_yaml2json)

ActiveRecord::Coder to transparently transition serialized attributes from YAML to JSON. In a recent
test creating/reading serialized records JSON outperfoms YAML by a wide margin.

Serializing the entire contents of the `ENV` hash 50,000 times:

                user     system      total        real
    yaml:  77.390000   9.220000  86.610000 (117.776747)
    json:  52.870000   8.240000  61.110000 ( 89.297786)

Deserializing those same 50,000 records:

                user     system      total        real
    yaml:  10.120000   0.380000  10.500000 ( 15.818386)
    json:   2.840000   0.100000   2.940000 (  7.896888)

More information available [here](http://pjkh.com/articles/postgresql-json-vs-rails-serialize/).

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

    # NOTE: 'data' will now be a hash with indifferent access.
    # This is because JSON doesn't understand symbols and stringifies
    # all keys.  YAML could do either.  This is necessary to support
    # existing access to the attributes.



## Contributing

1. Fork it ( https://github.com/supremegolf/serialize_yaml2json/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
