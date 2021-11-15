class CommentResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :body, :string
  attribute :event_id, :integer

  # Direct associations

  belongs_to :commenter,
             resource: UserResource,
             foreign_key: :user_id

  # Indirect associations

end
