class Venue < ApplicationRecord
  belongs_to :business
  has_many :surveys
end
