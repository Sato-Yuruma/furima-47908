FactoryBot.define do
  factory :order_address do
    postal_code   { '123-4567' }
    prefecture_id { 2 }
    city          { '帯広市' }
    house_number  { '1-2-3' }
    building_name { 'テストビル101' }
    phone_number  { '09012345678' }

    user_id { FactoryBot.create(:user).id }
    item_id { FactoryBot.create(:item).id }
  end
end
