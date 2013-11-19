Feature: Test requests to Bitly API
  Scenario: Call Highvalue
    Given the following parameters:
      | name          | value     | casting   |
      | limit         | 3         | integer   |
    When I request "Highvalue"
    Then the response has a "values" key
  Scenario: Call Search
    Given the following parameters:
      | name          | value     | casting   |
      | limit         | 3         | integer   |
      | query         | Simone    |           |
    When I request "Search"
    Then the response has a "results" key
