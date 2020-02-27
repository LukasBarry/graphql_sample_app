# GraphQL Sample App

Creating a sample GraphQL app to see how it works and test the different ways it can be used to help our overall project

- uses `graphiql` gem for front end testing
- set in `api` mode on Rails

### Documentation to get started:

- Start new rails project:
`$ rails new graphql_sample_app --api --skip-test`
- Add `graphql` and `graphiql` to Gemfile
`$ bundle install`
`$ rails g graphql:install`
- Run `rails g model User name:string email:string` for all models you want
- Once models are created, you can run graphql commands to generate a graphql object
`$ rails g graphql:object user`
- this will add the object to the graphql schema

#### Routes if using graphiql for viewing:
```ruby
Rails.application.routes.draw do
  post '/graphql', to: 'graphql#execute'

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: 'graphql#execute'
  end
end
```

#### If you created an api only Rails app:
- in `config/application.rb:15`
  - uncomment `require "sprockets/railtie"`
  - add assets folder under /app
  - add config folder inside assets folder
  - add `manifest.js` file inside config folder
  - add these two lines to the `manifest.js`:
    - `//= link graphiql/rails/application.css`
    - `//= link graphiql/rails/application.js`
- `$ rails s` should now load graphiql interface

#### To add objects/models to graphql schema:
`$ rails g graphql:object user`
`$ rails g graphql:object survey`
- this will create new `user_type.rb` and `survey_type.rb` files in the graphql/types folder

Inside `user_type.rb` file"
- add all fields for the model you want to include:
```ruby
field :id, ID, null: false
field :name, String, null: true
```
- you can also add fields for methods, and then define the methods below the listed fields:
```ruby
field :surveys_count, Integer, null: true

def surveys_count
  object.surveys.count
end
```
- `object` is what refers to the model instance in question

#### QueryType File
This is where all the actual magic is happening
- define fields that act as the query
`field :users, [Types::UserType], null: false`
- then define what the `users` query will do in a method:
```ruby
def users
  User.all
end
```
- can even pass arguments to these fields:
```ruby
field :user, Types::UserType, null: false do
  argument :id, ID, required: true
end

def user(id:)
  User.find(id)
end
```

#### Query Format
- curly brackets, then the method/field name, then list all the attributes you want returned:
Individual User:
```
{
  user(id: 2) {
    name
    email
    surveysCount
  }
}
```
All Users:
```
{
  users {
    name
    email
    surveysCount
  }
}
```
These can be nested too, to get associated models:
```
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
```

#### Mutations
- used for created a POST or PUT/PATCH requests, rather than GET requests
- mutations have arguments, like strong parameters, and fields which are return items

Create a new field for mutation (model) you need inside the mutations folder
- `CreateUser` mutation
First things passed are the arguments it will accept:
```ruby
argument :name, String, required: true
argument :email, String, required: true
```
Then define the fields it will return:
```ruby
field :user, Types::UserType, null: false
field :errors, [String], null: false
```
Then create the resolve method to actually save the object and return the data:
```ruby
def resolve(name:, email:)
  user = User.new(name: name, email: email)

  if user.save
    {
      user: user,
      errors: []
    }
  else
    {
      user: nil,
      errors: user.errors.full_messages
    }
  end
end
```

- Make sure to add the new mutation to the `mutation_type.rb` file under graphql/types
`field :create_user, mutation: Mutations::CreateUser`

#### To Run Mutation:
```
mutation {
  createUser(input: {
    name: "Carolyn",
    email: "carolyn@gmail.com"
  }) {
    user {
      id,
      name,
      email
    }
    errors
  }
}
```
- if successful, it will return the user data specified in the `create_user` mutation, otherwise it will return the error messages
