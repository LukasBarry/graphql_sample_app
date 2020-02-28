module Types
  class VenueType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :business, Types::BusinessType, null: false
    field :surveys, [Types::SurveyType], null: true
  end
end
