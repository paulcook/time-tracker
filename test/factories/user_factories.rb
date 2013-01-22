FactoryGirl.define do
  factory :user do
    name "Test User"
    email
    password "testpass"
    password_confirmation "testpass"
    
  end
  
  sequence :email do |n|
    "user#{n}@example.com"
  end
end
