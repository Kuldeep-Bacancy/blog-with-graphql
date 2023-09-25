class Mutations::DeletePost < GraphQL::Schema::Mutation

  argument :post, Types::PostInputType, required: true

  def resolve(post:)
    ex_post = Post.where(id: post[:id]).first
    ex_post&.destroy
    ex_post
  end

end