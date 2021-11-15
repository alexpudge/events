class Event < ApplicationRecord
  # Direct associations

  belongs_to :host,
             :class_name => "User",
             :foreign_key => "user_id",
             :counter_cache => true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    start_date
  end

end
