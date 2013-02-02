class Project < ActiveRecord::Base
	belongs_to :user
	has_many :tasks
	attr_accessible :name, :user_id
	validates :name, :presence => true
	default_scope order: "id DESC"

	def has_unique_name?(name)
    user.projects.map{ |p| return false if p.name.downcase === name.downcase }
    true
	end
end