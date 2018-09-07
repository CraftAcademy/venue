require 'rails_helper'

RSpec.describe Genre, type: :model do
  has_many :users
end
