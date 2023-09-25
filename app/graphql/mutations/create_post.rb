class Mutations::CreatePost < GraphQL::Schema::Mutation

  argument :post, Types::PostInputType, required: true

  def resolve(post:)
    Post.create(
      user_id: post[:user_id],
      body: post[:body]
    )
  end

end