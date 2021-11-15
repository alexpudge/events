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

  has_many   :guests,
             resource: InterestResource

  has_many   :comments

  belongs_to :host,
             resource: UserResource,
             foreign_key: :user_id

  # Indirect associations

end
