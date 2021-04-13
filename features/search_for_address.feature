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
