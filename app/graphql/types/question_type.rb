module Types
  class QuestionType < Types::BaseObject
    field :id, ID, null: false
    field :text, String, null: false
    field :business, Types::BusinessType, null: false
    field :responses, [Types::ResponseType], null: true
  end
end
