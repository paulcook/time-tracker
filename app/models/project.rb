class Project < ActiveRecord::Base
  has_many :tasks
  belongs_to :customer
  
  attr_accessible :name
  
  validates :name, presence: true
  validates :name, uniqueness: { scope: :customer_id }
  
  def to_s
    self.name
  end
end
