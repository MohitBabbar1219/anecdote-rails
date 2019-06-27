FactoryBot.define do
  factory :blog_post do
    title { Faker::Lorem.word }
    body { Faker::Lorem.paragraph }
    created_by {Faker::Number.number(10)}
  end
end