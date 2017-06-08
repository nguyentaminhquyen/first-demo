class Task < ApplicationRecord
  belongs_to :user
  belongs_to :project
	after_initialize :set_defaults, unless: :persisted?

  # The set_defaults will only work if the object is new
  def set_defaults
     self.status = 1
  end
end
