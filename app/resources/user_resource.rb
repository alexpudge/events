class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :firstname, :string
  attribute :lastname, :string
  attribute :status, :string

  # Direct associations

  # Indirect associations

end
