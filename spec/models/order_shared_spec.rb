require 'rails_helper'

RSpec.describe OrderShared, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item,user_id: user.id)
    @order_shared = FactoryBot.build(:order_shared, user_id: user.id, item_id: item.id)
  end

  describe '購入情報' do

    context '商品購入がうまくいくとき' do
      it "すべての値が正しく入力されていれば保存できること" do
        expect(@order_shared).to be_valid
      end
      it "建物名がなくても保存できる" do
        expect(@order_shared).to be_valid
      end
    end

    context '購入機能ががうまくいかないとき' do
      it "郵便番号がないと保存できない" do
        @order_shared.postal_code = ""
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Postal code can't be blank")
      end
      it "郵便番号は半角数字で-がないと保存できない" do
        @order_shared.postal_code = "1234567"
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it "都道府県が1だと保存できない" do
        @order_shared.item_prefecture_id = 1
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Item prefecture can't be blank")
      end

      it "市町村がないと登録できない" do
        @order_shared.city = ""
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("City can't be blank")
      end

      it "番地がないと保存できない" do
        @order_shared.addresses = ""
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Addresses can't be blank")
      end

      it "電話番号がないと保存できない" do
        @order_shared.phone_number = nil
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      it "電話番号は半角数字でないと保存できない" do
        @order_shared.phone_number = "０３０４９５８７４８５"
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Phone number is invalid")
      end
      it "電話番号は11桁じゃないと保存できない" do
        @order_shared.phone_number = 1234567890
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Phone number is invalid")
      end
      it "電話番号は半角英数字だと保存できない" do
        @order_shared.phone_number = "12345kdidd"
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Phone number is invalid")
      end

      it "user_idがないと保存できない" do
        @order_shared.user_id = nil
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("User can't be blank")
      end

      it "item_idがないと保存できない" do
        @order_shared.item_id = nil
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Item can't be blank")
     end

     it "tokenが空では登録できないこと" do
      @order_shared.token = nil
      @order_shared.valid?
      expect(@order_shared.errors.full_messages).to include("Token can't be blank")
     end
    
    end

  end

end
