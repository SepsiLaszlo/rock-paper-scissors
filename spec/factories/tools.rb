FactoryBot.define do
  factory :tool do
    after(:build) do |tool|
      tool.image.attach(
          io: File.open(Rails.root.join('db', 'images', 'Rock.svg')),
          filename: 'test.svg',
          content_type: 'image/svg'
        )
    end
    factory :rock do
      name { 'rock' }
    end

    factory :paper do
      name { 'paper' }
    end

    factory :scissors do
      name { 'scissors' }
    end
  end
end
