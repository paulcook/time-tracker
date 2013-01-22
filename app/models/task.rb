class Task < ActiveRecord::Base
  
  belongs_to :project
  
  attr_accessible :name
  
  validates :name, presence: true
  validates :name, uniqueness: { scope: :project_id }
  
  def to_s
    self.name
  end
end
