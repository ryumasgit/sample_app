FactoryBot.define do
  factoy :list do
    title { Faker::Lorem.characters(number:5)}
    body { Faker::Lorem.characters(number:30)}
  end
end