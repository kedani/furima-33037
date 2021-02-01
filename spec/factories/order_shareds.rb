FactoryBot.define do
  factory :order_shared do
    postal_code { '321-8002' }
    item_prefecture_id { 4 }
    city { '尼崎市' }
    addresses { '小泉2-27' }
    building { 'サンライズ' }
    phone_number { '08012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
