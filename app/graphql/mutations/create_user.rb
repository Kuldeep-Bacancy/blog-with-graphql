class Mutations::CreateUser < GraphQL::Schema::Mutation

  argument :user, Types::UserInputType, required: true

  def resolve(user:)
    User.create(
      first_name: user[:first_name],
      last_name: user[:last_name],
      street: Faker::Address.street_name,
      number: Faker::Address.building_number,
      city: Faker::Address.city,
      postcode: Faker::Address.postcode,
      country: Faker::Address.country,
    )
  end

end