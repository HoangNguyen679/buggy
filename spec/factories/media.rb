FactoryBot.define do
  factory :medium do
    title { SecureRandom.hex(3) }
    url do
      [
        'https://youtube.com/v=abcxyz',
        'https://youtube.com/v=defgik',
      ].sample
    end
    description { SecureRandom.hex(20) }
  end
end
