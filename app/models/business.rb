class Business < ApplicationRecord
  has_many :venues
  has_many :questions
  has_many :surveys
end
