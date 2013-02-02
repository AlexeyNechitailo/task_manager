class Task < ActiveRecord::Base
	belongs_to :project
	belongs_to :priority
	attr_accessible :name, :project_id, :deadline, :priority_id, :is_done
	validates :name, :presence => true
	default_scope order: "id DESC"

	def has_unique_name_in_project?(name)
    project.tasks.map{ |t| return false if t.name.downcase === name.downcase }
    true
	end

end