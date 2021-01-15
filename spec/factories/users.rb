FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    surname               {"花丸"}
    first_name            {"国木田"}
    birthday              {"2002-03-04"}
    surname_kana          {"ハナマル"}
    first_name_kana       {"クニキダ"}
  end
end