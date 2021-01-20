require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品" do
    context '商品出品がうまくいくとき' do
      it "item_nameとitem_infoとitem_category_idとitem_sales_status_idとitem_shipping_fee_status_idとitem_prefecture_idとitem_scheduled_delivery_idとitem_priceとimageがあれば登録できる" do
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

    it "商品状態の情報がないと保存できない" do
      @item.item_prefecture_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Item prefecture can't be blank")
    end

    it "配達料の負担の情報がないと保存できない" do
      @item.item_sales_status_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Item sales status can't be blank")
    end

    it "発送元の地域の情報がないと保存できない" do
      @item.item_scheduled_delivery_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Item scheduled delivery can't be blank")
    end

    it "発送までの日数の情報がないと保存できない" do
      @item.item_shipping_fee_status_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Item shipping fee status can't be blank")
    end

    it "価格についての情報がないと保存できない" do
      @item.item_price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price is invalid", "Item price can't be blank")
    end
    it "価格の範囲が300円から9999999円の間でないと保存できない" do
      @item.item_price = 20
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
