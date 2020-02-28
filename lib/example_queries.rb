# GET queries:
{
  user(id: 2) {
    name
    email
    surveysCount
  }
}

{
  users {
    name
    email
    surveysCount
  }
}

{
  user(id: 2) {
    name
    email
    surveys {
      title
      body
    }
  }
}

# POST queries:
mutation {
  createUser(input: {
    name: "Carolyn",
    email: "carolyn@gmail.com"
  }) {
    user {
      id
      name
      email
    }
    errors
  }
}

mutation {
  createSurvey(input: {
    title: "My first survey",
    body: "Taking my first survey to see how it works. Sounds like fun",
    userId: 6
  }) {
    survey {
      id
      title
      body
      user {
        name
        email
      }
    }
    errors
  }
}
