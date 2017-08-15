include RandomData
include FactoryGirl

20.times do
    FactoryGirl.create(:wiki) do |wiki|
        wiki.title = RandomData.random_sentence,
        wiki.body = RandomData.random_paragraph
    end
end
wikis = Wiki.all


puts "Seed finished"
puts "#{Wiki.count} wikis created"
