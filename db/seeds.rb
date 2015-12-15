# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


FactoryGirl.define do
  # factory :question do
  #   sequence(:title) { |n| "Why shit so crazy? #{n}" }
  #   sequence(:body) { |n| "Can anyboy tell me why shit so crazy? #{n}" }
  # end
end

3.times do
  FactoryGirl.create(:question)
end
