class Project < ApplicationRecord
	has_many :tasks, dependent: :destroy
	has_many :members
	has_many :users, through: :members,dependent: :destroy
	after_initialize :set_defaults, unless: :persisted?
  # The set_defaults will only work if the object is new
  def set_defaults
     self.status = 1
  end

	def self.search(author_id,pattern,current_page)
		if pattern.blank?  # blank? covers both nil and empty string
			where(author_id: author_id).paginate(:page => current_page,:per_page => 4)
		else
			where('author_id = ? and name LIKE ?',author_id, "%#{pattern}%").group(:id).paginate(:page => current_page,:per_page => 4)
		end
	end

  def self.get_projects_by_user(user_id,current_page)
		where(author_id: user_id).group(:id).paginate(:page => current_page,:per_page => 4)
	end

end
