@javascript
Feature: Artist can attach image to her profile
    As an Artist
    In order to promote ourself/myself
    We/I would like to be able to attach images to our/my profile

    Background:
        Given the following user exist
        | email           | password   |
        | artist@venue.se | my-pasword |
        And I am logged in as 'artist@venue.se'

    Scenario:
        When I am on the 'landing' page
        And I wait 2 seconds 
        Then I click on 'Create Artist Profile'
        And I fill in 'Artist name' with 'Kanye West'
        And I fill in 'Genre' with 'Hip-Hop'
        And I fill in 'City' with 'Los Angeles'
        And I fill in 'Artist Description' with 'Born in Atalanta, raised in Chicago'
        And I fill in 'Facebook' with 'https://www.facebook.com/TheKanyewestPage/'
        And I fill in 'Instagram' with 'https://www.instagram.com/kanyewest'
        And I fill in 'Twitter' with 'https://twitter.com/kanyewest'
        And I fill in 'Youtube' with 'https://www.youtube.com/'
        And I fill in 'Website' with 'https://www.kanyewest.com/'
        And I fill in 'Spotify' with 'https://open.spotify.com/artist/5K4W6rqBFWDnAN6FQUkS6x?si=4zpontE-TrmF46FSVJcNHA'
        And I attach a profile_image
        And I attach a background_image
        And I click on 'Create Profile'
        And I wait 5 seconds
        Then I should see 'Artist page successfully created'
        And I should be redirected to the Artist page for 'Kanye West'
        And an artist profile page with the name 'Kanye West' should have been created
        Then I should see the background image
        And I should see the profile image
