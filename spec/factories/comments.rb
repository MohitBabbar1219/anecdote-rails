FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.words(20) }
    commenter { Faker::FunnyName.name }
    commentable_id { Faker::Number.number(2) }
    commentable_type { %w(Comment BlogPost).sample }
  end
end