Given(/^a search for a zip code$/) do
  @url = 'https://viacep.com.br/ws/'
end

Given(/^the informed state is ([^"]*)$/) do |uf|
  uf.upcase!
  unless(uf_isValid?(uf))
    raise RuntimeError, 'The informed UF is not valid'
  end
  
  @url += "#{uf}/"
end

Given(/^the informed city is ([^"]*)$/) do |city|
  unless(city_isValid?(city))
    raise RuntimeError, 'The informed CITY is not valid'
  end
  
  @url += "#{city}/"
end

Given(/^the informed street is ([^"]*)$/) do |street|
  unless(street_isValid?(street))
    raise RuntimeError, 'The informed STREET is not valid'
  end
  
  @url += "#{street}/"
end

Given(/^the return format defined was "([^"]*)"$/) do |return_format|
  return_format.downcase!
  if(return_format == 'json')
    @url += "#{return_format}/"
  else
    raise RuntimeError, 'The return format is not valid or was not informed'
  end  
end

#...

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
  if(uf.length < 3)
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
