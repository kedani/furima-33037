FactoryBot.define do
  factory :item do
    item_name                   {"花丸"}
    item_info                   {"美品です"}
    item_category_id            {2}
    item_sales_status_id        {2}
    item_shipping_fee_status_id {2}
    item_prefecture_id          {2}
    item_scheduled_delivery_id  {2}
    item_price                  {2000}
    association :user           

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/130904633.jpg'), filename: '130904633.jpg')
    end
  end
end
