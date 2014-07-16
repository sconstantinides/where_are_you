
# Where Are You

## What does it do?

Returns the location (city, state, or country) for the current user through their IP address (via IP-API.com).

## How does it work?

Place the following in your Gemfile:

```ruby
gem 'where_are_you'
```

To return the current user's city & state, call the following anywhere in a Controller or View:

```ruby
where_are_you(request.remote_ip)
```

## Examples

You can query a user's city, state, or country:

```ruby
where_are_you(request.remote_ip) # returns "Chicago, IL"

where_are_you(request.remote_ip, 'city') # also returns "Chicago, IL"
where_are_you(request.remote_ip, 'state') # returns "Illinois"
where_are_you(request.remote_ip, 'country') # returns "United States"
```

## International

By default, international values return 'nil' for city & state queries. To override this (with sometimes odd results) add a third parameter of 'true':

```ruby
where_are_you(request.remote_ip, 'city', true) # returns "Berlin, 16", "Montréal, QC"
where_are_you(request.remote_ip, 'state', true) # returns "Berlin", "Quebec"
where_are_you(request.remote_ip, 'country') # true is not needed in this case, returns "Germany", "Canada"
```

## Comments

Please send any questions or suggestions to sconstantinides@gmail.com
