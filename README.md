
# Where Are You

## What does it do?

Returns the location (city, state, or country), or language, for the current request using its IP address (via IP-API.com).

## How does it work?

Place the following in your Gemfile:

```ruby
gem 'where_are_you'
```

To lookup the current user's city & state, call the following anywhere in a Controller or View:

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
where_are_you(request.remote_ip, 'language') # returns "en"
```
## Language

We support languages for over 250 countries, but if the country is not supported, where_are_you returns nil.

## International

By default, international values return 'nil' for city & state queries. To override this (with sometimes odd results) add a third parameter of 'true':

```ruby
where_are_you(request.remote_ip, 'city', true) # returns "Berlin, 16", "Montréal, QC"
where_are_you(request.remote_ip, 'state', true) # returns "Berlin", "Quebec"
where_are_you(request.remote_ip, 'country') # true is not needed in this case, returns "Germany", "Canada"
```

## Limits

IP-API.com will automatically ban IP addresses with over 240 requests per minute. Visit http://ip-api.com/docs/unban to unban your IP address.
