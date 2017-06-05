class Project < ApplicationRecord
	has_many :tasks, dependent: :destroy
	has_many :members
	has_many :users, through: :members,dependent: :destroy

end
