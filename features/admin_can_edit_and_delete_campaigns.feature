Feature: Admin can edit and delete campaigns
    As an Admin
    In order to be in control of the content of the Campaigns
    I would like to be able to edit and delete Campaigns

    Background:
        Given the following user exist
            | email          | role   |
            | admin@venue.se | admin  |
        And the following campaign exist
            | title                        | state     |
            | Veronica Maggio in Stockholm | accepted  |

    Scenario: Admin can delete campaign
        Given I am logged in as 'admin@venue.se'
        And I am on the 'landing' page
        And I click on 'Veronica Maggio in Stockholm' detail box
        Then I should be redirected to the Campaign page for 'Veronica Maggio in Stockholm'
        And I click on 'Delete Campaign'
        Then there should be a Campaign titled 'Veronica Maggio in Stockholm' in the Database

    Scenario: Admin can edit campaign