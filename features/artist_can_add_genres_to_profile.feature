@javascript
Feature: Artist has genres
    As an Artist
    In order to promote myself
    I would like to be able to add Genres to my profile
     
     Background:
        Given the following user exist
        | email          | role   | password   |
        | user@artist.se | artist | my-pasword |
        And I am logged in as 'user@artist.se'
     
     Scenario: Artist has genres
        And I am on the 'landing' page
        And I click on 'New Campaign'
        Then I should see the 'Create a New Campaign' form
        And I fill in 'Title' with 'Clare Cunningham'
        And I fill in 'Description' with 'Dubbed as having a vocal register similar to Adele'
        And I fill in 'Location' with 'Stockholm'
        And I choose genre form the 'Genre' field
        And I click on 'Launch Campaign'
        When I wait 1 second
        Then I should be on 'Clare Cunningham' campaign page