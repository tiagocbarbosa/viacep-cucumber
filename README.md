# viacep-cucumber

### TO DO:
> Criar um cenário de testes para cada validação
> - buscar usando endereço válido: https://viacep.com.br/ws/BA/Lauro De Freitas/Rua José Leite/json/
> - buscar usando cep válido: https://viacep.com.br/ws/41205017/json/
> - buscar usando cep inválido: https://viacep.com.br/ws/99999999/json/
> - buscar usando cep no formato inválido: https://viacep.com.br/ws/950100100/json/
> Finalizar este README.md

## Running the project
Run the following script in the directory of the project to execute it (I do recommend to use the CMDER shell):

```sh
cucumber features\search_for_zip_code.feature --publish-quiet
```

 *The --publish-quiet option is to disable a LOG message from the Cucumber framework*
 
 // ...

## References
[ViaCEP API document](https://viacep.com.br/)

[Creating Ruby basic structure](https://stackoverflow.com/questions/30358612/how-to-create-a-gemfile)

[Adding Cucumber dependecies](https://cucumber.io/docs/installation/ruby/)

[Defining step definition](https://www.guru99.com/cucumber-basics.html)

[CMDER shell](https://cmder.net/)

[Executing .feature file](https://www.youtube.com/watch?v=YcepXZ2VR0I)
