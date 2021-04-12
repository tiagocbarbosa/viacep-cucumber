Given(/^a search for a zip code$/) do
  @url = 'https://viacep.com.br/ws/'
end

Given(/^the informed state is ([^"]*)$/) do |uf|
  uf.upcase!
  unless(uf_isValid?(uf))
    raise RuntimeError, 'The informed UF is not valid'
  end

  @url += "#{uf}/"
  log(@url)
end

#...

def uf_isValid?(uf)
  if(uf.length != 2)
    false
  else
    true
  end
end
