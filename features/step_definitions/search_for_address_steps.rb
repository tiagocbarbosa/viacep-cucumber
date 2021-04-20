require 'httparty'
require 'json'

# Class to check if a String is numeric
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

    @zipcode = zipcode
end

And(/^the return format of "([^"]*)"$/) do |return_format|
    return_format.downcase!
    if(return_format == 'json')
      @return_format = return_format
    else
      raise RuntimeError, 'The return format is not valid or was not informed'
    end  
end

When (/^I search for the address$/) do
    response = HTTParty.get("#{@base_url}/#{@zipcode}/#{@return_format}/")
    if(response.code == 200)
        @street = response.parsed_response['logradouro']
    else
        raise RuntimeError, 'Error getting the response'
    end
    # write more ELSE statements
end

Then (/^I validate the street value matches with ([^"]*)$/) do |street|
    unless(street_areSame?(street))
        raise RuntimeError, 'The streets are not the same'
    end
end

Then (/^I validate the street value does not match with ([^"]*)$/) do |street|
    if(street_areSame?(street))
        raise RuntimeError, 'The streets are the same'
    end
end

# Zip code must be a 8 digit number
def zipcode_isValid?(zipcode)
    if(zipcode.length != 8 || !zipcode.numeric?)
        false
    else
        true
    end
end

# Check if the streets are the same
def street_areSame?(street)
    if(@street == street)
        true
    else
        false
    end
end
