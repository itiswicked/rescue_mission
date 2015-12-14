FactoryGirl.define do
  factory :question do
    sequence(:title) { |n| "Why shit so crazy? #{n}" }
    sequence(:body) { |n| "Can anyboy tell me why shit so crazy? #{n}" }
  end
end
