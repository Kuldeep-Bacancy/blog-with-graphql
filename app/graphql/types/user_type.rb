# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String
    field :last_name, String
    field :street, String
    field :number, Integer
    field :city, String
    field :postcode, Integer
    field :country, String
    field :full_name, String
    field :full_address, String
    field :posts, [Types::PostType]
    field :comments, [Types::CommentType]
    field :errors, [String], null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def errors
      object.errors.full_messages
    end
  end

  class UserInputType < GraphQL::Schema::InputObject
    graphql_name 'UserInputType'
    
    argument :id, ID, required: false
    argument :first_name, String, required: true
    argument :last_name, String, required: true
  end
end


