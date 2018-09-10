@javascript
Feature: Admin can edit and delete campaigns
    As an Admin
    In order to be in control of the content of the Campaigns
    I would like to be able to edit and delete Campaigns

    Background:
        Given the following campaign exist
        | title                         |
        | Veronica Maggio in Stockholm  |
        And the following user exist
        | email          | role  |
        | admin@venue.se | admin |
        And I am logged in as 'admin@venue.se'

    Scenario: Admin can delete campaign
        Given I am on the Campaign page for 'Veronica Maggio in Stockholm'
        And I click on 'Delete Campaign'
        And I click on 'OK' in the confirmation popup
        Then I wait 1 second
        Then there should NOT be a Campaign titled 'Veronica Maggio in Stockholm' in the Database
        And I should see 'Campaign deleted'
        And I should be redirected to the 'Campaigns' page

    Scenario: Admin can edit campaign