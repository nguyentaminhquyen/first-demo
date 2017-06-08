class Project < ApplicationRecord
	has_many :tasks, dependent: :destroy
	has_many :members
	has_many :users, through: :members,dependent: :destroy
	after_initialize :set_defaults, unless: :persisted?
  # The set_defaults will only work if the object is new
  def set_defaults
     self.status = 1
  end
end
