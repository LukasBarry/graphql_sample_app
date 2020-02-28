class Mutations::CreateResponse < Mutations::BaseMutation
  argument :answer, String, required: true
  argument :survey_id, ID, required: true
  argument :question_id, ID, required: true

  field :question, Types::QuestionType, null: false
  field :errors, [String], null: false

  def resolve(answer:, survey_id:, question_id:)
    question = Question.find(question_id)
    response = question.responses.new(answer: answer, survey_id: survey_id)

    if response.save
      {
        response: response,
        errors: []
      }
    else
      {
        response: nil,
        errors: response.errors.full_messages
      }
    end
  end
end
