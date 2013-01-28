class Priority < ActiveRecord::Base
  belongs_to :task
  attr_accessible :name
  validates :name, :presence => true
end