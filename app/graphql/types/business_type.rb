module Types
  class BusinessType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :industry, String, null: true
    field :venues, [Types::VenueType], null: true
    field :surveys, [Types::SurveyType], null: true
    field :questions, [Types::QuestionType], null: true
    field :settings, String, null: true

    def settings
      {
        settings: {
          industry: object.industry,
          questions_count: object.questions.count,
          survey_count: object.surveys.count,
          venue_count: object.venues.count
        }
      }
    end
  end
end
