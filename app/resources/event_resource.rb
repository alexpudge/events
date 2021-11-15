class EventResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :start_date, :date
  attribute :start_time, :string
  attribute :end_date, :date
  attribute :end_time, :string
  attribute :address, :string
  attribute :details, :string
  attribute :photo, :string
  attribute :status, :string
  attribute :user_id, :integer

  # Direct associations

  # Indirect associations

end
