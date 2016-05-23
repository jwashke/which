FactoryGirl.define do
  factory :user do
    sequence :display_name do |n|
      "user #{n}"
    end
    sequence :email do |n|
      "user#{n}@example.com"
    end
    sequence :uid do |n|
      "#{n}"
    end
    sequence :token do |n|
      "#{n}"
    end
  end
end
