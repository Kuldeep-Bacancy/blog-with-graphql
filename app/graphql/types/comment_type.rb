# frozen_string_literal: true

module Types
  class CommentType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :body, String
    field :errors, [String], null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def errors
      object.errors.full_messages
    end
  end

  class CommentInputType < GraphQL::Schema::InputObject
    graphql_name 'CommentInputType'
    
    argument :id, ID, required: false
    argument :body, String, required: true
  end
end
