module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :email, String, null: true
    field :surveys, [Types::SurveyType], null: true
    field :surveys_count, Integer, null: true

    def surveys_count
      object.surveys.count
    end
  end
end
