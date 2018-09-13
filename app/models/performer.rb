class Performer < ApplicationRecord
    validates_presence_of :name, :genre, :city, :description, :state
    has_and_belongs_to_many :users
    has_and_belongs_to_many :genres
    has_many :campaigns, through: :users
    has_one_attached :profile_image
    has_one_attached :background_image

    state_machine :state, initial: :active do 
        event :archive do
            transition active: :archived
        end
    end

    validate :profile_image_format

    private

    def profile_image_format
        return unless profile_image.attached?
        return if profile_image.blob.content_type.start_with? 'image/'
        profile_image.purge_later
        errors.add(:profile_image, 'needs to be an image')
    end

    def background_image_format
        return unless background_image.attached?
        return if background_image.blob.content_type.start_with? 'image/'
        background_image.purge_later
        errors.add(:background_image, 'needs to be an image')
    end
end  