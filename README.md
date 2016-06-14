# CheckTCPMemory

This is a simple Nagios/Sensu check that checks that the current TCP memory usage is below the maximum allowed in the Linux kernel.  This will find leaking TCP sockets.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'check_tcp_memory'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install check_tcp_memory

## Usage

```
$ check_tcp_memory -h
Usage: check_tcp_memory -w <warn percent> -c <critical percent>
    -w, --warn-percent PERCENT       Warning when percentage of total TCP memory is over this threashold. Default: 50%
    -c, --crit-percent PERCENT       Critical when percentage of total TCP memory is over this threashold. Default: 60%
    -h, --help                       Show this message
        --version                    Show version
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Altiscale/check_tcp_memory. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

