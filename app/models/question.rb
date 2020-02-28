class Question < ApplicationRecord
  belongs_to :business
  has_many :responses
end
