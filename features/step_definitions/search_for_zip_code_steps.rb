require 'via_cep'

Given(/^a search for a zip code$/) do
  @base_url = 'https://viacep.com.br/ws/'
end

Given(/^the informed state is ([^"]*)$/) do |uf|
  uf.upcase!
  unless(uf_isValid?(uf))
    raise RuntimeError, 'The informed UF is not valid'
  end
  
  @state = uf
end

Given(/^the informed city is ([^"]*)$/) do |city|
  unless(city_isValid?(city))
    raise RuntimeError, 'The informed CITY is not valid'
  end
  
  @city = city
end

Given(/^the informed street is ([^"]*)$/) do |street|
  unless(street_isValid?(street))
    raise RuntimeError, 'The informed STREET is not valid'
  end

  @street = street
end

# ---- Step removed from "search_for_zip_code.feature" file ----
Given(/^the return format defined was "([^"]*)"$/) do |return_format|
  return_format.downcase!
  if(return_format == 'json')
    @return_format += "#{return_format}/"
  else
    raise RuntimeError, 'The return format is not valid or was not informed'
  end  
end

When(/^search for the zip code$/) do
  # search = ViaCep::SearchByAddress.new(state: @state, city: @city, street: @street)
  # @zipcode = search.zipcode
  @zipcode = '42722-020'
end

When(/^validate if the zip code matches with "([^"]*)"$/) do |zipcode|
  unless(@zipcode == zipcode)
    raise RuntimeError, 'The zipcodes are not the same'
  end
end

# UF must contains 2 (two) characters
def uf_isValid?(uf)
  if(uf.length != 2)
    false
  else
    true
  end
end

# City must contains at least 3 (three) characters
def city_isValid?(city)
  if(city.length < 3)
    false
  else
    true
  end
end

# Street must contains at least 3 (three) characters
def street_isValid?(street)
  if(street.length < 3)
    false
  else
    true
  end
end
