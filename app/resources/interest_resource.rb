class InterestResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :event_id, :integer
  attribute :response, :string

  # Direct associations

  belongs_to :event

  belongs_to :guest,
             resource: UserResource,
             foreign_key: :user_id

  # Indirect associations
end
