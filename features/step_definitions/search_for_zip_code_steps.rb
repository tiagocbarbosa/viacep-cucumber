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

#...

def uf_isValid?(uf)
  # UF must contains 2 (two) characters
  if(uf.length != 2)
    false
  else
    true
  end
end

def city_isValid?(city)
  # city must contains at least 3 (three) characters
  if(uf.length < 3)
    false
  else
    true
  end
end
