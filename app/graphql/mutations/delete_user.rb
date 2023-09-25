class Mutations::DeleteUser < GraphQL::Schema::Mutation

  argument :user, Types::UserInputType, required: true

  def resolve(user:)
    ex_user = User.where(id: user[:id]).first
    ex_user&.destroy
    ex_user
  end

end