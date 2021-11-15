class Interest < ApplicationRecord
  # Direct associations

  belongs_to :event,
             counter_cache: :guests_count

  belongs_to :guest,
             class_name: "User",
             foreign_key: "user_id"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    guest.to_s
  end
end
