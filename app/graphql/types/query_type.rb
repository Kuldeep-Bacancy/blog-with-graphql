module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :users, [Types::UserType], null: false, description: 'Display all users'
    field :user, Types::UserType do
      argument :id, Integer, required: true
    end
    field :comments, [Types::CommentType], null: false
    field :posts, [Types::PostType], null: false

    def users
      User.includes(:posts, :comments).all
    end

    def user(id:)
      User.where(id:).first
    end

    def comments
      Comment.includes(:post, :user).all
    end

    def posts
      Post.includes(:user, :comments).all
    end
  end
end
