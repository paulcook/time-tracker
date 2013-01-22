FactoryGirl.define do
  factory :project do
    customer
    name { generate(:project_name) }
  end
  
  sequence :project_name do |n|
    "Project #{n}"
  end
end