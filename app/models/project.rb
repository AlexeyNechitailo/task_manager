class Project < ActiveRecord::Base
	belongs_to :user
	has_many :tasks, :dependent => :destroy
	attr_accessible :name, :user_id
	validates :name, :presence => true
	# default_scope order: "id DESC"

	def has_unique_name?(name)
    user.projects.each{ |p| return false if p.name.downcase === name.downcase }
    true
	end
end