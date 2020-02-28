module Types
  class QueryType < Types::BaseObject
    # /users
    field :users, [Types::UserType], null: false
    # /surveys
    field :surveys, [Types::SurveyType], null: false
    # /businesses
    field :businesses, [Types::BusinessType], null: false
    # /venues
    field :venues, [Types::VenueType], null: false
    # /questions
    field :questions, [Types::QuestionType], null: false
    # /responses
    field :responses, [Types::ResponseType], null: false
    # /user/:id
    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end
    # /survey/:id
    field :survey, Types::SurveyType, null: false do
      argument :id, ID, required: true
    end
    # /business/:id
    field :business, Types::BusinessType, null: false do
      argument :id, ID, required: true
    end
    # /venue/:id
    field :venue, Types::VenueType, null: false do
      argument :id, ID, required: true
    end
    # /question/:id
    field :question, Types::QuestionType, null: false do
      argument :id, ID, required: true
    end
    # /response/:id
    field :response, Types::ResponseType, null: false do
      argument :id, ID, required: true
    end

    def users
      User.preload(:surveys).all
    end

    def surveys
      Survey.all
    end

    def businesses
      Business.all
    end

    def venues
      Venue.all
    end

    def questions
      Question.all
    end

    def responses
      Response.all
    end

    def user(id:)
      User.find(id)
    end

    def survey(id:)
      Survey.find(id)
    end

    def business(id:)
      Business.find(id)
    end

    def venue(id:)
      Venue.find(id)
    end

    def question(id:)
      Question.find(id)
    end

    def response(id:)
      Response.find(id)
    end
  end
end
