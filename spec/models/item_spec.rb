require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item,user_id: user.id)
  end

  describe "商品出品" do
    context '商品出品がうまくいくとき' do
      it "必要な情報があれば保存できる" do
      expect(@item).to be_valid
      end
   end
  end

  context '出品機能ががうまくいかないとき' do
    it "商品画像がないと保存できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "商品名がないと保存できない" do
      @item.item_name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end

    it "商品の説明がないと保存できない" do
      @item.item_info = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Item info can't be blank")
    end

    it "商品のカテゴリー選択がないと保存できない" do
      @item.item_category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Item category is not a number", "Item category can't be blank")
    end
    it "item_category_idが1だと保存できない" do
      @item.item_category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Item category must be other than 1")
    end
    it "商品状態の情報がないと保存できない" do
      @item.item_prefecture_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Item prefecture can't be blank")
    end
    it "item_prefecture_idが1だと保存できない" do
      @item.item_prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Item prefecture must be other than 1")
    end
    it "配達料の負担の情報がないと保存できない" do
      @item.item_sales_status_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Item sales status can't be blank")
    end
    it "item_sales_status_idが1だと保存できない" do
      @item.item_sales_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Item sales status must be other than 1")
    end
    it "発送元の地域の情報がないと保存できない" do
      @item.item_scheduled_delivery_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Item scheduled delivery can't be blank")
    end
    it "item_scheduled_delivery_idが1だと保存できない" do
      @item.item_scheduled_delivery_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Item scheduled delivery must be other than 1")
    end

    it "発送までの日数の情報がないと保存できない" do
      @item.item_shipping_fee_status_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Item shipping fee status can't be blank")
    end
    it "item_shipping_fee_status_idが1だと保存できない" do
      @item.item_shipping_fee_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Item shipping fee status must be other than 1")
    end

    it "価格についての情報がないと保存できない" do
      @item.item_price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price is invalid", "Item price can't be blank")
    end
    it "価格の範囲が300円以下だと保存できない" do
      @item.item_price = 20
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price is invalid")
    end
     it "価格の範囲が9999999円以上だと保存できない" do
       @item.item_price = 11111111
       @item.valid?
       expect(@item.errors.full_messages).to include("Item price is invalid")
     end
     it "価格は半角数字出ないと保存できない" do
       @item.item_price = "２５２５２"
       @item.valid?
       expect(@item.errors.full_messages).to include("Item price is invalid")
     end
  end
end
