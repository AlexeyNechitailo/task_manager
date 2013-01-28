class User < ActiveRecord::Base
	has_many :projects
	attr_accessible :name, :email, :password, :password_confirmation

  has_secure_password
  validates :email, :presence => true, :uniqueness => true
  validates :password, presence: true,
                       confirmation: true,
                       on: :create

  def guest?
    id.nil?
  end

end