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
  Scenario: Call RealtimeBursting_phrases
    When I request "RealtimeBursting_phrases"
    Then the response has a "phrases" key
    Then the response has a "current_lag" key
    Then the response has a "selectivity" key
    Then the response has a "time" key
  Scenario: Call RealtimeHot_phrases
    When I request "RealtimeHot_phrases"
    Then the response has a "phrases" key
    Then the response has a "lag" key
    Then the response has a "time" key
  Scenario: Call RealtimeClickrate
    Given the following parameters:
      | name          | value     | casting   |
      | phrase        | Pizza     |           |
    When I request "RealtimeClickrate"
    Then the response has a "lag" key
    Then the response has a "phrase" key
    Then the response has a "rate" key
    Then the response has a "time" key
  Scenario: Call LinkInfo
    Given the following parameters:
      | name          | value                       | casting   |
      | link          | http://bit.ly/bitly_website |           |
    When I request "LinkInfo"
    Then the response has a "canonical_url" key
    Then the response has a "category" key
  Scenario: Call LinkContent
    Given the following parameters:
      | name          | value                       | casting   |
      | link          | http://bit.ly/bitly_website |           |
    When I request "LinkContent"
    Then the response has a "content" key
    Then the response has a "content_type" key
  Scenario: Call LinkContent with content_type
    Given the following parameters:
      | name          | value                       | casting   |
      | link          | http://bit.ly/bitly_website |           |
      | content_type  | text                        |           |
    When I request "LinkContent"
    Then the response has a "content" key
    Then the response has a "content_type" key
  Scenario: Call LinkCategory
    Given the following parameters:
      | name          | value                       | casting   |
      | link          | http://bit.ly/bitly_website |           |
    When I request "LinkCategory"
    Then the response has a "categories" key
  Scenario: Call LinkSocial
    Given the following parameters:
      | name          | value                       | casting   |
      | link          | http://bit.ly/bitly_website |           |
    When I request "LinkSocial"
    Then the response has a "social_scores" key
  Scenario: Call LinkLocation
    Given the following parameters:
      | name          | value                       | casting   |
      | link          | http://bit.ly/bitly_website |           |
    When I request "LinkLocation"
    Then the response has a "locations" key
  Scenario: Call LinkLanguage
    Given the following parameters:
      | name          | value                       | casting   |
      | link          | http://bit.ly/bitly_website |           |
    When I request "LinkLanguage"
    Then the response has a "languages" key
  Scenario: Call Expand
    Given the following parameters:
      | name          | value                        | casting   |
      | shortUrl      | http://bit.ly/bitly_website  |           |
    When I request "Expand"
    Then the response has a "expand" key
  Scenario: Call Expand with hash
    Given the following parameters:
      | name      | value         | casting   |
      | hash      | bitly_website |           |
    When I request "Expand"
    Then the response has a "expand" key
  Scenario: Call Info
    Given the following parameters:
      | name          | value                        | casting   |
      | shortUrl      | http://bit.ly/bitly_website  |           |
    When I request "Info"
    Then the response has a "info" key
  Scenario: Call Info with hash
    Given the following parameters:
      | name      | value         | casting   |
      | hash      | bitly_website |           |
    When I request "Info"
    Then the response has a "info" key
  Scenario: Call expanded Info with hash
    Given the following parameters:
      | name      | value         | casting   |
      | hash      | bitly_website |           |
      | expand    | true          |           |
    When I request "Info"
    Then the response has a "info" key
  Scenario: Call link edit
    Given the following parameters:
      | name      | value                        | casting   |
      | link      | http://bit.ly/11doabL        |           |
      | edit      | note,note                    | array     |
      | title     | Set From Behat               |           |
      | note      | Set From Behat               |           |
    When I request "UserLink_edit"
    Then the response has a "link_edit" key
  Scenario: Call lookup
    Given the following parameters:
      | name      | value                        | casting   |
      | url       | http://www.iliveinperego.com |           |
    When I request "UserLink_lookup"
    Then the response has a "link_lookup" key
  Scenario: Call shorten
    Given the following parameters:
      | name      | value                        | casting   |
      | longUrl   | http://www.iliveinperego.com |           |
    When I request "Shorten"
    Then the response has a "global_hash" key
    Then the response has a "hash" key
    Then the response has a "long_url" key
    Then the response has a "new_hash" key
    Then the response has a "url" key
  Scenario: Call link lookup
    Given the following parameters:
      | name      | value                        | casting   |
      | url       | http://www.iliveinperego.com |           |
    When I request "UserLink_lookup"
    Then the response has a "link_lookup" key
  Scenario: Call link save
    Given the following parameters:
      | name      | value                        | casting   |
      | longUrl   | http://www.iliveinperego.com |           |
      | title     | Set From Behat 'link save'   |           |
      | note      | Set From Behat 'link save'   |           |
    When I request "UserLink_save"
    Then the response has a "link_save" key
  Scenario: Call link clicks
    Given the following parameters:
      | name      | value                        | casting   |
      | link      | http://bit.ly/bitly_website  |           |
      | unit      | month                        |           |
      | units     | 2                            |           |
      | rollup    | true                         |           |
      | timezone  | 0                            |           |
    When I request "LinkClicks"
    Then the response has a "link_clicks" key
  Scenario: Call link countries
    Given the following parameters:
      | name      | value                        | casting   |
      | link      | http://bit.ly/bitly_website  |           |
      | unit      | month                        |           |
      | units     | 2                            |           |
    When I request "LinkCountries"
    Then the response has a "countries" key
  Scenario: Call link encoders
    Given the following parameters:
      | name      | value                        | casting   |
      | link      | http://bit.ly/bitly_website  |           |
      | limit     | 20                           |           |
    When I request "LinkEncoders"
    Then the response has a "aggregate_link" key
  Scenario: Call link encoders by count
    Given the following parameters:
      | name      | value                        | casting   |
      | link      | http://bit.ly/bitly_website  |           |
      | limit     | 20                           |           |
    When I request "LinkEncoders_by_count"
    Then the response has a "aggregate_link" key
  Scenario: Call link encoders count
    Given the following parameters:
      | name      | value                        | casting   |
      | link      | http://bit.ly/bitly_website  |           |
    When I request "LinkEncoders_count"
    Then the response has a "aggregate_link" key
  Scenario: Call link referrers
    Given the following parameters:
      | name      | value                        | casting   |
      | link      | http://bit.ly/bitly_website  |           |
    When I request "LinkReferrers"
    Then the response has a "referrers" key
  Scenario: Call link referrers by domain
    Given the following parameters:
      | name      | value                        | casting   |
      | link      | http://bit.ly/bitly_website  |           |
    When I request "LinkReferrers_by_domain"
    Then the response has a "referrers" key
  Scenario: Call link referring domain
    Given the following parameters:
      | name      | value                        | casting   |
      | link      | http://bit.ly/bitly_website  |           |
      | unit      | month                        |           |
      | units     | 1                            |           |
    When I request "LinkReferring_domains"
    Then the response has a "referring_domains" key
  Scenario: Call link shares
    Given the following parameters:
      | name      | value                        | casting   |
      | link      | http://bit.ly/bitly_website  |           |
      | unit      | month                        |           |
      | units     | 1                            |           |
      | rollup    | true                         |           |
      | timezone  | 0                            |           |
    When I request "LinkShares"
    Then the response has a "shares" key