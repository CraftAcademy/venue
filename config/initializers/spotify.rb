secret = Rails.application.credentials.spotify[:client_secret]
id = Rails.application.credentials.spotify[:client_id]
RSpotify.authenticate(id, secret)