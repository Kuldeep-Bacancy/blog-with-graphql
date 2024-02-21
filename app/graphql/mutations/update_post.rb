class Mutations::UpdatePost < GraphQL::Schema::Mutation
  argument :id, Integer, required: true
  argument :body, String, required: true

  field :post, Types::PostType, null: true
  field :errors, [String], null: false

  def resolve(id:, body:)
    post = Post.find_by(id:)
    return { post: nil, errors: ['Post not found!'] } if post.nil?

    if post.update(body:)
      { post:, errors: [], msg: 'Post updated Successfully!' }
    else
      { post: nil, errors: post.errors.full_messages }
    end
  end
end
