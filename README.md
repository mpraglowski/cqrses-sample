[![Build Status](https://travis-ci.org/mpraglowski/cqrses-sample.svg?branch=master)](https://travis-ci.org/mpraglowski/cqrses-sample)

Sample code to shop how easy build CQRS & Event Sourcing into Rails application.

To run it you must have working Event Store (http://geteventstore.com) available on http://localhost:2113

If you want change default configuration setup in in `lib/storage_injector.rb` with:

```ruby
def storage
  @storage ||= HttpEventstore::Connection.new do |config|
    config.endpoint = 'localhost'
    config.port = 2113
  end
end
```
