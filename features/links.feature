Feature: links

  Scenario: click link to another page
    Given I'm on the link page
    When I click the "View Form" link
    Then I should be on the form page
