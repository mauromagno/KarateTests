Feature: Sample API Tests
  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

  Scenario: Test a sample GET API
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print response

  Scenario: Test a sample GET API with param
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response


  Scenario: Test a sample GET API with validations
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response
    And match response.data[0].first_name != null
    And assert response.data.length == 6
    And match response.data[3].id == 10