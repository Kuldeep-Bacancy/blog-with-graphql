module Types
  class MutationType < Types::BaseObject
    field :create_user, Types::UserType, mutation: Mutations::CreateUser
    field :update_user, Types::UserType, mutation: Mutations::UpdateUser
    field :delete_user, Types::UserType, mutation: Mutations::DeleteUser
    # field :create_comment, Types::CommentType, mutation: Mutations::CreateComment
    # field :update_comment, Types::CommentType, mutation: Mutations::UpdateComment
    # field :delete_comment, Types::CommentType, mutation: Mutations::DeleteComment
    field :create_post, Types::PostType, mutation: Mutations::CreatePost
    field :update_post, Types::PostType, mutation: Mutations::UpdatePost
    field :delete_post, Types::PostType, mutation: Mutations::DeletePost
  end
end
