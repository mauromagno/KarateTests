Feature: Test Post API
  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

  Scenario: Test a sample POST API
    Given path '/users'
    And request { "name": "Mauro", "job": "student" }
    When method POST
    Then status 201
    And print response


  Scenario: Test a sample POST API with match response (error)
    Given path '/users'
    And request { "name": "Mauro", "job": "student" }
    When method POST
    Then status 201
    And match response == { "createdAt": "2022-01-03T16:56:25.678Z", "name": "Mauro", "id": "273", "job": "student" }
    And print response

  Scenario: Test a sample POST API with match response (No Error)
    Given path '/users'
    And request { "name": "Mauro", "job": "student" }
    When method POST
    Then status 201
    And match response == { "createdAt": "#ignore", "name": "Mauro", "id": "#string", "job": "student" }
    And print response
