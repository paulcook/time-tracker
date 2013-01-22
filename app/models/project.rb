class Project < ActiveRecord::Base
  
  belongs_to :customer
  attr_accessible :name
  
  validates :name, :presence=>true, :uniqueness=>true
  
  def to_s
    self.name
  end
end
