FactoryBot.define do
  factory :tool do
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
