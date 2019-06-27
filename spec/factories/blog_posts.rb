FactoryBot.define do
  factory :blog_post do
    title { Faker::Lorem.word }
    body { Faker::Lorem.paragraph }
    author {Faker::Superhero.name}
  end
end