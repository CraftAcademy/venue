Then("I should see {string}") do |content|
    expect(page).to have_content content
end

Then("I should see the {string} form") do |content|
    expect(page).to have_content content
end

Then("I should NOT see {string}") do |content|
    expect(page).not_to have_content content 
end

Then("there should be a Campaign titled {string} in the Database") do |expected_title|
    campaign = Campaign.find_by(title: expected_title)
    expect(campaign).not_to eq nil
end

Then("there should NOT be a Campaign titled {string} in the Database") do |campaign_title|
    campaign = Campaign.find_by(title: campaign_title)
    expect(campaign).to eq nil
end

Then("I should be redirected to the {string} page") do |page_name|
    expect(current_path).to eq page_path(page_name)    
end

Then("I should be redirected to the Campaign page for {string}") do |campaign_title|
    campaign = Campaign.find_by(title: campaign_title)
    expect(current_path).to eq campaign_path(campaign)
end

Then("I should be redirected to the Artist page for {string}") do |performer_title|
    performer = Performer.find_by(name: performer_title)
    expect(current_path).to eq performer_path(performer)
end

Then("I should be redirected to the landing page") do |string|
    expect(current_path).to eq root_path
end

Then("there should be a user in the database with the email {string}") do |expected_email|
    user = User.find_by(email: expected_email)
    expect(user.email).to eq expected_email
end

Then("the user {string} should be a/an {string}") do |expected_email, expected_role|
    user = User.find_by(email: expected_email)
    expect(user.role).to eq expected_role
end

Then("the user should be a/an {string}") do |expected_role|
    user = User.last
    expect(user.role).to eq expected_role
end

Then("an artist profile page with the name {string} should have been created") do |artist_name|
    performer = Performer.find_by(name: artist_name)
    expect(performer.name).to eq artist_name
end

Then("I should see the {string} image") do |file_name|
    expect(page).to have_css "img[src*='#{file_name}']"
end

Then("I should be on {string} campaign page") do |campaign_title|
    campaign = Campaign.find_by(title: campaign_title)
    expect(current_path).to eq campaign_path(campaign)
end

Then("the state of the campaign {string} should be {string}") do |campaign_title, campaign_state|
    campaign = Campaign.find_by(title: campaign_title)
    expect(campaign.state).to eq campaign_state
end

Then("the campaign {string} is accepted") do |campaign_title|
    campaign = Campaign.find_by(title: campaign_title)
    campaign.accept
end
Then("there should be a Ticket named {string} in the Database") do |expected_name|
    sleep 0.5
    ticket = Ticket.find_by(name: expected_name)
    expect(ticket).not_to eq nil
end

Then("I should see {string} in ticket info") do |expected_content| 
    within("#tickets") do 
        expect(page).to have_content expected_content
    end
end 
