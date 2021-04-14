# viacep-cucumber
This is my [ViaCEP](https://viacep.com.br/) public API validation project using Cucumber and Ruby technologies. 

## About
This is my personal project created to apply my programming knowledge.

### Technologies involved
`cucumber` `ruby`

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

- It has step definitions writen in Ruby.

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


#### TO DO:
> Criar um cenário de testes para cada validação
> - buscar usando cep válido: https://viacep.com.br/ws/41205017/json/
> - buscar usando cep inexistente: https://viacep.com.br/ws/99999999/json/
> - buscar usando cep no formato inválido: https://viacep.com.br/ws/950100100/json/
 
> Finalizar este README.md

## Running the project
Run the following script in the directory of the project to execute it (I do recommend to use the CMDER shell):

```sh
cucumber features\search_for_zip_code.feature --publish-quiet
```

 *The --publish-quiet option is to disable a LOG message from the Cucumber framework*
 
// to be continued...

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
