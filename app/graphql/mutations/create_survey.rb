class Mutations::CreateSurvey < Mutations::BaseMutation
  argument :title, String, required: true
  argument :body, String, required: true
  argument :user_id, ID, required: true

  field :survey, Types::SurveyType, null: false
  field :errors, [String], null: false

  def resolve(title:, body:, user_id:)
    user = User.find(user_id)
    survey = user.surveys.build(title: title, body: body, user_id: user.id)

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
