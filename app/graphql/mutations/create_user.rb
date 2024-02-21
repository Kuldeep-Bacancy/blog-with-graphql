class Mutations::CreateUser < GraphQL::Schema::Mutation
  argument :first_name, String, required: true
  argument :last_name, String, required: true

  field :user, Types::UserType, null: true
  field :errors, [String], null: false

  def resolve(first_name:, last_name:)
    user = User.new(
      first_name:,
      last_name:,
      street: Faker::Address.street_name,
      number: Faker::Address.building_number,
      city: Faker::Address.city,
      postcode: Faker::Address.postcode,
      country: Faker::Address.country
    )

    if user.save
      { user:, errors: [], msg: 'User created Successfully!' }
    else
      { user: nil, errors: user.errors.full_messages }
    end
  end
end
