FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
   end
   nick_name {Faker::Name.last_name}
   last_name {person.last.kanji}
   last_name_reading {person.last.katakana}
   first_name {person.first.kanji}
   first_name_reading {person.first.katakana}
   email {Faker::Internet.free_email}
   password = Faker::Internet.password(min_length: 6)
   password {password}
   password_confirmation {password}
   birthday {Faker::Date.birthday}
  end
end
