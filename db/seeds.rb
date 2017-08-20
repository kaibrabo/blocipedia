include RandomData
include FactoryGirl

20.times do
    FactoryGirl.create(:wiki) do |wiki|
        wiki.title = RandomData.random_sentence,
        wiki.body = RandomData.random_paragraph
    end
end
wikis = Wiki.all

5.times do
    FactoryGirl.create(:user) do |user|
        user.email = :email,
        user.password = "password"
    end
end


puts "Seeding finished"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"
