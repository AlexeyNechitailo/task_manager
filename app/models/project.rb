class Project < ActiveRecord::Base
	belongs_to :user
	has_many :tasks
	attr_accessible :name, :user_id
	validates :name, :presence => true
	default_scope order: "id DESC"
end