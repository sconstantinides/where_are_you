
class Object
  def where_are_you(ip, format = 'city', global = false)

    require 'net/http'
    require 'json'
    require 'yaml'

    uri = URI.parse("http://ip-api.com/json/#{ip}")
    response = Net::HTTP.get_response(uri)
    result = JSON(response.body)
    data = YAML::load_file(File.dirname(__FILE__) + '/data.yml')

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

    elsif format == 'language'

      formatted_country = result['country'].downcase.gsub(' ','_').gsub(',','_')
      return data[formatted_country]

    end
  end
end
