FactoryGirl.define do
  factory :task do
    name { generate(:task_name) }
    project
  end
  
  factory :task_time do
    task
    user
  end
  
  sequence :task_name do |n|
    "Task #{n}"
  end
end