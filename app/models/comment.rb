class Comment < ApplicationRecord
  # Direct associations

  belongs_to :comment_board,
             class_name: "Event",
             foreign_key: "event_id",
             counter_cache: true

  belongs_to :commenter,
             class_name: "User",
             foreign_key: "user_id"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    commenter.to_s
  end
end
