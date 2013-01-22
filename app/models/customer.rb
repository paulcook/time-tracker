class Customer < ActiveRecord::Base
  attr_accessible :address1, :address2, :address3, :city, :email, :fax1, :fax2, :name, :phone1, :phone2, :state, :website, :zipcode
  
  validates :name, :presence=>true, :uniqueness=>true
  
  has_many :projects
  
  def to_s
    self.name
  end
end
