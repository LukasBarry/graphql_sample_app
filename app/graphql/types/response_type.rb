module Types
  class ResponseType < Types::BaseObject
    field :id, ID, null: false
    field :answer, String, null: false
    field :survey, Types::SurveyType, null: false
    field :question, Types::QuestionType, null: false
  end
end
