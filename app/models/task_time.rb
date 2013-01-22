class TaskTime < ActiveRecord::Base
  belongs_to :task
  belongs_to :user
  
  attr_accessor :hours, :minutes, :seconds
  attr_accessible :started_at, :stopped_at, :total_time, :user_id, :minutes, :hours, :seconds
  
  before_validation :calculate_total_time
  
  def calculate_total_time
    total_in_minutes = minutes.to_i || 0
    
    if !hours.blank?
      total_in_minutes += hours.to_i*60
    end
    
    if !seconds.blank?
      if seconds.to_i >= 30
        total_in_minutes += 1
      end
    end
    self.total_time = total_in_minutes
  end
end
