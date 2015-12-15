FactoryGirl.define do

  factory :question do
    sequence(:title) { |n| "Why shit so crazy? #{n}" * 3 }
    sequence(:body) { |n| "Can anyboy tell me why shit so crazy? #{n}" * 4 }
  end

  factory :invalid_question, class: Question do
    sequence(:title) { |n| "Why shit so crazy? #{n}" }
    sequence(:body)  { |n| "Can anyboy tell me why shit so crazy? #{n}" }
  end

  factory :answer do
    body "I'm not sure man, but watch out for Cobra commander and eat your veggies"
  end
  
end
