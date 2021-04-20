Feature: Search for address

    The ViaCEP public API allows to search for a address using a
    8 digit zip code (e.g., '01001000'). Also the return format
    must be defined, it can be JSON, XML, Querty...

    Scenario Outline: User informs valid zip code
        Given a zip code search
        And a value of <zipcode>
        And the return format of "json"
        When I search for the address
        Then I validate the street value matches with <street>

        Examples:
            | zipcode  | street             |
            | 41205017 | Rua Tancredo Neves |
            | 01001000 | Praça da Sé        |
            | 91420270 | Rua São Domingos   |

    Scenario Outline: User informs invalid zip code
        Given a zip code search
        And a value of <zipcode>
        And the return format of "json"
        When I search for the address
        Then I validate the street value does not match with <street>

        Examples:
            | zipcode  | street             |
            | 41205017 | Rua Tancredo Neves |
            | 01001000 | Praça da Sé        |
            | 91420270 | Rua São Domingos   |
