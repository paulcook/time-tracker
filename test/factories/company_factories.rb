FactoryGirl.define do
  factory :customer do
    name
    
    factory :customer_with_info do
      address1 "An Address"
      city "Colubus"
      state "OH"
      zipcode "43210"
      phone1 "6145551234"
      fax1 "6145554321"
      email "company@example.com"
      website "http://www.example.com"
    end
    
  end
  
  sequence :name do |n|
    "Company #{n}"
  end
  
end