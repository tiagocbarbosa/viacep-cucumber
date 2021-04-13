class String
    def numeric?
        Float(self) != nil rescue false
    end
end

Given(/^a zip code search$/) do
    @base_url = 'https://viacep.com.br/ws/'
end

And(/^a value of ([^"]*)$/) do |zipcode|
    unless(zipcode_isValid?(zipcode))
        raise RuntimeError, 'The zip code is alphanumeric or does not have 8 digits'
    end

    log(zipcode)
    @zipcode = zipcode
end

Given(/^the return format of "([^"]*)"$/) do |return_format|
    return_format.downcase!
    if(return_format == 'json')
      @return_format = return_format
    else
      raise RuntimeError, 'The return format is not valid or was not informed'
    end  
end

# ...

# Zip code must be a 8 digit number
def zipcode_isValid?(zipcode)
    if(zipcode.length != 8 || !zipcode.numeric?)
        false
    else
        true
    end
end
