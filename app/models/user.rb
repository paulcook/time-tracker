class User < ActiveRecord::Base
  
  has_many :task_times
  has_many :tasks, through: :task_times
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :name, :remember_me
  
  validates :name, presence: true
  
  def to_s
    self.name
  end
end
