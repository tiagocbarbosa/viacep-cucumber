Feature: Search for zip code

    The ViaCEP public API allows to search for a unknown zip code
    by searching using the three required parameters: UF, city and
    street. Also the return format must be defined, it can be JSON,
    XML, Querty...

    Scenario: User informs the address
        Given a search for a zip code
        * the informed state is <uf>
        * the informed city is <city>
        * the informed street is <street>
        And the return format defined was "json"
        When search for the zip code
        Then validate if the zip code matches with "42722-020"

        Examples:
            | uf | city             | street         |
            | BA | Lauro de Freitas | Rua José Leite |
