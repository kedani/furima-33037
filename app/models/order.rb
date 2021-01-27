class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :shared

  # with_options presence: true do
  #   validates :user_id
  #   validates :item_id
  # end
end
