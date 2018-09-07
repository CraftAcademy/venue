class Ticket < ApplicationRecord
    validate_presence_of :price
    
    belongs_to :user
    belongs_to :artist
    belongs_to :campaign
end
