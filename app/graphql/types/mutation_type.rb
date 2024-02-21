module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :update_user, mutation: Mutations::UpdateUser
    field :delete_user, mutation: Mutations::DeleteUser
    field :create_post, Types::PostType, mutation: Mutations::CreatePost
    field :update_post, Types::PostType, mutation: Mutations::UpdatePost
    field :delete_post, Types::PostType, mutation: Mutations::DeletePost
  end
end
