class Comment < ApplicationRecord
  # Direct associations

  belongs_to :commenter,
             :class_name => "User",
             :foreign_key => "user_id"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    commenter.to_s
  end

end
