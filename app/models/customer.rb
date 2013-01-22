class Customer < ActiveRecord::Base
  has_many :projects
  
  attr_accessible :address1, :address2, :address3, :city, :email, :fax1, :fax2, :name, :phone1, :phone2, :state, :website, :zipcode
  
  validates :name, :presence=>true, :uniqueness=>true
  
  def to_s
    self.name
  end
end
