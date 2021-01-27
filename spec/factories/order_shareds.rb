FactoryBot.define do
  factory :order_shared do
    postal_code { '321-8002' }
    prefecture_id { 4 }
    city { '尼崎市' }
    addresses { '小泉2-27' }
    building { 'サンライズ' }
    phone_number { '08012345678' }
  end
end
