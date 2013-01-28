class Task < ActiveRecord::Base
	belongs_to :project
	has_one :priority
	attr_accessible :name, :project_id
	validates :name, :presence => true
	default_scope order: "id DESC"
end