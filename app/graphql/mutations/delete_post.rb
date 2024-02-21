class Mutations::DeletePost < GraphQL::Schema::Mutation
  argument :id, String, required: true

  field :post, Types::PostType, null: true
  field :errors, [String], null: false

  def resolve(id:)
    post = Post.find_by(id:)
    return { post: nil, errors: ['Post not found!'] } if post.nil?

    if post.destroy
      { post:, errors: [], msg: 'Post deleted Successfully!' }
    else
      { post: nil, errors: post.errors.full_messages }
    end
  end
end
