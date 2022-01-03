Feature: Test Post API
  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read("createPersonOutput.json")


  Scenario: Test a sample POST API with match response (error)
    Given path '/users'
    And request { "name": "Diogo", "job": "student" }
    When method POST
    Then status 201
    And match response == expectedOutput
    And print response


