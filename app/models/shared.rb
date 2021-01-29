class Shared < ApplicationRecord
  belongs_to :order

  # with_options presence: true do
  #   validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
  #   validates :item_prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  #   validates :city
  #   validates :addresses
  #   validates :phone_number, format: { with: \A0[5789]0[-]?\d{4}[-]?\d{4}\z }
  # end
  
end
