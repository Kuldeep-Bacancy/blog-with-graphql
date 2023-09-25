class Mutations::UpdateUser < GraphQL::Schema::Mutation

  argument :user, Types::UserInputType, required: true

  def resolve(user:)
    ex_user = User.where(id: user[:id]).first
    ex_user&.update user.to_h
    ex_user
  end

end