# spec/factories/posts.rb

FactoryBot.define do
  factory :post do
    created_at { Date.current }

    # Добавляем фабрику для создания поста с определенными датами
    factory :post_with_dates do
      transient do
        start_date { Date.current }
        end_date { Date.current }
      end

      after(:build) do |post, evaluator|
        post.created_at = Faker::Time.between(from: evaluator.start_date.beginning_of_day, to: evaluator.end_date.end_of_day)
      end
    end
  end
end
