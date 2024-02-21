class Mutations::CreatePost < GraphQL::Schema::Mutation
  argument :user_id, Integer, required: true
  argument :body, String, required: true

  field :post, Types::PostType, null: true
  field :errors, [String], null: true

  def resolve(user_id:, body:)
    post = Post.new(
      user_id:,
      body:
    )

    if post.save
      { post:, errors: [], msg: 'Post created Successfully!' }
    else
      { post: nil, errors: post.errors.full_messages }
    end
  end
end
