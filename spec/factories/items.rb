FactoryBot.define do
    factory :item do
        name { Faker::Creature::Animal.name }
        done false
        deadline DateTime.now
        todo_id nil
    end
end