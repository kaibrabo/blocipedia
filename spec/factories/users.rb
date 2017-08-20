FactoryGirl.define do
    pw = RandomData.random_word

    factory :user do
        sequence(:email){|n| "user#{n}@factory.com" }
        confirmed_at Time.now
        password pw
        password_confirmation pw
    end


end
