class Mutations::CreateVenue < Mutations::BaseMutation
  argument :name, String, required: true
  argument :business_id, ID, required: true

  field :venue, Types::VenueType, null: false
  field :errors, [String], null: false

  def resolve(name:, business_id:)
    business = Business.find(business_id)
    venue = business.venues.new(name: name)

    if venue.save
      {
        venue: venue,
        errors: []
      }
    else
      {
        venue: nil,
        errors: venue.errors.full_messages
      }
    end
  end
end
