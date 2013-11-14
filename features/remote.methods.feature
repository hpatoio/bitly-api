Feature: Test requests to Bitly API
  Scenario: Call Highvalue
    Given the following parameters:
      | name          | value     | casting   |
      | limit         | 3         | integer   |
    When I request "Highvalue"
    Then the response has a "values" key
