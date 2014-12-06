require 'minitest/autorun'
require 'where_are_you'

class WhereAreYouTest < Minitest::Test

  # Default with domestic IP

    def test_default
      result = where_are_you('207.168.107.83')
      assert_equal result, 'Chicago, IL'
    end

  # Defailt with international IP

    def test_international_default
      result = where_are_you('131.228.17.26')
      assert_equal result, nil
    end

  # Domestic IP without international flag set

    def test_city
      result = where_are_you('207.168.107.83', 'city')
      assert_equal result, 'Chicago, IL'
    end

    def test_state
      result = where_are_you('207.168.107.83', 'state')
      assert_equal result, 'Illinois'
    end

    def test_country
      result = where_are_you('207.168.107.83', 'country')
      assert_equal result, 'United States'
    end

  # Domestic IP with international flag set

    def test_city_with_flag
      result = where_are_you('207.168.107.83', 'city', true)
      assert_equal result, 'Chicago, IL'
    end

    def test_state_with_flag
      result = where_are_you('207.168.107.83', 'state', true)
      assert_equal result, 'Illinois'
    end

    def test_country_with_flag
      result = where_are_you('207.168.107.83', 'country', true)
      assert_equal result, 'United States'
    end

  # International IP without international flag set

    def test_international_city
      result = where_are_you('131.228.17.26', 'city')
      assert_equal result, nil
    end

    def test_international_state
      result = where_are_you('131.228.17.26', 'state')
      assert_equal result, nil
    end

    def test_international_country
      result = where_are_you('131.228.17.26', 'country')
      assert_equal result, 'United Kingdom'
    end

  # International IP with international flag set

    def test_international_city_with_flag
      result = where_are_you('131.228.17.26', 'city', true)
      assert_equal result, 'London, ENG'
    end

    def test_international_state_with_flag
      result = where_are_you('131.228.17.26', 'state', true)
      assert_equal result, 'England'
    end

    def test_international_country_with_flag
      result = where_are_you('131.228.17.26', 'country', true)
      assert_equal result, 'United Kingdom'
    end

  # Domestic language

    def test_language_united_states
      result = where_are_you('207.168.107.83', 'language')
      assert_equal result, 'en'
    end

    def test_language_united_kingdom
      result = where_are_you('131.228.17.26', 'language')
      assert_equal result, 'en'
    end

    def test_language_congo
      result = where_are_you('217.171.91.0', 'language')
      assert_equal result, 'fr'
    end

end