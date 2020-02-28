class Mutations::CreateQuestion < Mutations::BaseMutation
  argument :text, String, required: true
  argument :business_id, ID, required: true

  field :question, Types::QuestionType, null: false
  field :errors, [String], null: false

  def resolve(text:, business_id:)
    business = Business.find(business_id)
    question = business.questions.new(text: text)

    if question.save
      {
        question: question,
        errors: []
      }
    else
      {
        question: nil,
        errors: question.errors.full_messages
      }
    end
  end
end
