@javascript
Feature: As an Artist
    In order to promote ourself/myself
    We/I would like to be able to attach images to our/my profile

    Background:
        Given the following user exist
        | email          | role   | password   |
        | user@artist.se | admin  | my-pasword |
        And I am logged in as 'user@artist.se'
