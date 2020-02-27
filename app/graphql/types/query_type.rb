module Types
  class QueryType < Types::BaseObject
    # /users
    field :users, [Types::UserType], null: false
    # /surveys
    field :surveys, [Types::SurveyType], null: false
    # /user/:id
    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end
    # /survey/:id
    field :survey, Types::SurveyType, null: false do
      argument :id, ID, required: true
    end

    def users
      User.all
    end

    def user(id:)
      User.find(id)
    end

    def surveys
      Survey.all
    end

    def survey(id:)
      Survey.find(id)
    end
  end
end
