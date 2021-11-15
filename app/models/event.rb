class Event < ApplicationRecord
  # Direct associations

  has_many   :comments,
             :dependent => :destroy

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
