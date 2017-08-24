FactoryGirl.define do
    sequence :email do |n|
        "user#{n}@factory.com"
    end

    pw = RandomData.random_sentence

    factory :user do
        email { generate(:email) }
        confirmed_at Time.now
        password pw
        password_confirmation pw
    end


end
