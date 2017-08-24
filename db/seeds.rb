include RandomData
include FactoryGirl

puts "Seeding..."

5.times do
    FactoryGirl.create(:user)
end

puts "#{User.count} users created"

20.times do
    FactoryGirl.create(:wiki, user: User.first) do |wiki|
        wiki.title = RandomData.random_sentence,
        wiki.body = RandomData.random_paragraph
    end
end

puts "#{Wiki.count} wikis created"

puts "Seed finished"
