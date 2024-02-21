class Mutations::UpdateUser < GraphQL::Schema::Mutation
  argument :id, Integer, required: true
  argument :first_name, String, required: false
  argument :last_name, String, required: false
  argument :street, String, required: false
  argument :number, Integer, required: false
  argument :city, String, required: false
  argument :postcode, Integer, required: false
  argument :country, String, required: false

  field :user, Types::UserType, null: true
  field :errors, [String], null: false

  def resolve(id:, **args)
    user = User.find_by(id:)
    return { user: nil, errors: ['User not found!'] } if user.nil?

    if user.update(args.to_h)
      { user:, errors: [] }
    else
      { user: nil, errors: user.errors.full_messages }
    end
  end
end
