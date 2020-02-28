class Mutations::CreateBusiness < Mutations::BaseMutation
  argument :name, String, required: true
  argument :industry, String, required: true

  field :business, Types::BusinessType, null: false
  field :errors, [String], null: false

  def resolve(name:, industry:)
    business = Business.new(name: name, industry: industry)

    if business.save
      {
        business: business,
        errors: []
      }
    else
      {
        business: nil,
        errors: business.errors.full_messages
      }
    end
  end
end
