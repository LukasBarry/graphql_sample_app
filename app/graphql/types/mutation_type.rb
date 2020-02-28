module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_survey, mutation: Mutations::CreateSurvey
    field :create_business, mutation: Mutations::CreateBusiness
    field :create_venue, mutation: Mutations::CreateVenue
    field :create_question, mutation: Mutations::CreateQuestion
    field :create_response, mutation: Mutations::CreateResponse
  end
end
