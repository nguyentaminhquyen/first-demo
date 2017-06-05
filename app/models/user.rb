class User < ApplicationRecord
  #EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  #validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  #validates :password, :presence => true
  has_many :tasks, dependent: :destroy
  has_many :members
	has_many :projects, through: :members,dependent: :destroy
  def self.authenticate(email,password)
    # Check if user.exist or not
    @user = User.find_by_email_and_password(email,password)
    logger.debug "ID: #{@user.id}"
    if @user
      return @user
    end
    return nil
  end
end
