# viacep-cucumber
This is my personal project created to apply my programming knowledge. In this project, I validate the [ViaCEP](https://viacep.com.br/) public API using `cucumber` and `ruby` technologies. 

## Characteristics
 - It has Gherkin syntax in the features files.

```gherkin
Feature: Search for address

 The ViaCEP public API allows to search for a address using a
 8 digit zip code (e.g., '01001000'). Also the return format
 must be defined, it can be JSON, XML, Querty...

 Scenario: User informs valid zip code
  Given a zip code search
  And a value of <zipcode>
  And the return format of "json"
  When I search for the address
  Then I validate the street value matches with <street>

  Examples:
   | zipcode  | street             |
   | 41205017 | Rua Tancredo Neves |
```

*/features/search_for_address.feature*

- It has step definitions written in Ruby.

```ruby
Given(/^a zip code search$/) do
 @base_url = 'https://viacep.com.br/ws/'
end

And(/^a value of ([^"]*)$/) do |zipcode|
 unless(zipcode_isValid?(zipcode))
   raise RuntimeError, 'The zip code is alphanumeric or does not have 8 digits'
 end

 @zipcode = zipcode
end

# ...
```

*/features/step_definitions/search_for_address_steps.ruby*

- It also has HTTP request using [third party](https://github.com/jnunemaker/httparty) gem.

```ruby
When (/^I search for the address$/) do
 response = HTTParty.get("#{@base_url}/#{@zipcode}/#{@return_format}/")
 if(response.code == 200)
  @street = response.parsed_response['logradouro']
 else
  # ...
 end 
end
```

*/features/step_definitions/search_for_address_steps.ruby*

## Running the project
You can run the following script in the directory of the project to execute it (I do recommend to use the CMDER shell):

```
cucumber features\search_for_address.feature --publish-quiet
```

*The --publish-quiet option is to disable a LOG message from the Cucumber framework*

In case of success, the shell of your choice should output something like this:

```
$ cucumber features\search_for_address.feature --publish-quiet
Feature: Search for address
 The ViaCEP public API allows to search for a address using a
 8 digit zip code (e.g., '01001000'). Also the return format
 must be defined, it can be JSON, XML, Querty...

 Scenario: User informs valid zip code                   # features/search_for_address.feature:7
  Given a zip code search                                # features/search_for_address.feature:8
  And a value of <zipcode>                               # features/search_for_address.feature:9
  And the return format of "json"                        # features/search_for_address.feature:10
  When I search for the address                          # features/search_for_address.feature:11
  Then I validate the street value matches with <street> # features/search_for_address.feature:12

  Examples:
   | zipcode  | street             |
   | 41205017 | Rua Tancredo Neves |

1 scenario (1 passed)
5 steps (5 passed)
0m0.540s

$
```

## Acknowledgments
That is pretty much it. Did you like my project? Star it and connect with me on my [LinkedIn profile](https://www.linkedin.com/in/tiagocastrobarbosa).

## References
[ViaCEP API document](https://viacep.com.br/)

[ViaCEP Ruby gem](https://github.com/marcelobarreto/via_cep)

[Creating Ruby basic structure](https://stackoverflow.com/questions/30358612/how-to-create-a-gemfile)

[Adding Cucumber dependecies](https://cucumber.io/docs/installation/ruby/)

[Defining step definition](https://www.guru99.com/cucumber-basics.html)

[Check if a String is numeric](https://mentalized.net/journal/2011/04/14/ruby-how-to-check-if-a-string-is-numeric/)

[HTTParty gem](https://github.com/jnunemaker/httparty)

[CMDER shell](https://cmder.net/)

[Executing .feature file](https://www.youtube.com/watch?v=YcepXZ2VR0I)
