FactoryGirl.define do
  factory :track, class: Music::Track do
    artist { Faker::Name.name }
    title { Faker::Commerce.product_name }
    track_number { rand(1 .. 20) }
    filepath { "#{artist}\ -\ #{title}.mp3" }
  end
end