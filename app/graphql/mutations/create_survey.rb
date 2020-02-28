class Mutations::CreateSurvey < Mutations::BaseMutation
  argument :venue_id, ID, required: true
  argument :business_id, ID, required: true
  argument :user_id, ID, required: true

  field :survey, Types::SurveyType, null: false
  field :errors, [String], null: false

  def resolve(venue_id:, business_id:, user_id:)
    user = User.find(user_id)
    survey = user.surveys.new(
      venue_id: venue.id, business_id: business.id
    )

    if survey.save
      {
        survey: survey,
        errors: []
      }
    else
      {
        survey: nil,
        errors: survey.errors.full_messages
      }
    end
  end
end
