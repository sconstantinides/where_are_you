
class Object
  def where_are_you(ip, format = 'city', global = false)

    require 'net/http'
    require 'json' # already included in Rails

    uri = URI.parse("http://ip-api.com/json/#{ip}")
    response = Net::HTTP.get_response(uri)
    result = JSON(response.body)

    if result['status'] != 'success'

      return nil

    elsif format == 'city'

      if global || result['country'] == 'United States'
        return result['city'] + ', ' + result['region']
      else
        return nil
      end

    elsif format == 'state'

      if global || result['country'] == 'United States'
        return result['regionName']
      else
        return nil
      end

    elsif format == 'country'

      return result['country']

    end

  end
end
