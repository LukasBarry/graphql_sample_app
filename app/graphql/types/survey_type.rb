module Types
  class SurveyType < Types::BaseObject
    field :id, ID, null: false
    field :user, Types::UserType, null: false
    field :venue, Types::VenueType, null: false
    field :business, Types::BusinessType, null: false
    field :responses, [Types::ResponseType], null: true
  end
end
