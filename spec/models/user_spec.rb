require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとsurnameとfirst_nameとbirthdayとsurname_kanaとfirst_name_kanaが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
    it "nicknameが空だと登録できない" do
       @user.nickname = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できない" do
       @user.email = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailは@がないと登録できない" do
      @user.email = "keda.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "passwordが空だと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが５文字以下だと登録できない" do
      @user.password = "keda"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordは半角英数字混合じゃないと登録できない" do
      @user.password = "kedasoccer"
      @user.password_confirmation = "kedasoccer"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password should contain both letters and numbers")
    end

    it "passwordは２回入力しないと登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordとpassword_confirmationは一致していないと登録できない" do
      @user.password = "kfda33"
      @user.password_confirmation = "keda51"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "surnameとfirst_nameがないと登録できない" do
      @user.surname = "花丸"
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "surnameとfirst_nameは全角での入力でないと登録できない" do
      @user.surname = "花丸"
      @user.first_name = "kunikida"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end
    it "surname_kanaとfirst_name_kanaがないと登録できない" do
      @user.surname_kana = "ハナマル"
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana カタカナを使用してください")
    end
    it "surname_kanaとfirst_name_kanaは全角カタカナでの入力でないと登録できない" do
      @user.surname_kana = "クニキダ"
      @user.first_name_kana = "国木田"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana カタカナを使用してください")
    end

    it "surnameとfirst_nameがないと登録できない" do
      @user.surname = ""
      @user.first_name = "国木田"
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname can't be blank")
    end
    it "surnameとfirst_nameは全角での入力でないと登録できない" do
      @user.surname = "hanamaru"
      @user.first_name = "kunikida"
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname 全角文字を使用してください")
    end
    it "surname_kanaとfirst_name_kanaがないと登録できない" do
      @user.surname_kana = ""
      @user.first_name_kana = "クニキダ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname kana can't be blank", "Surname kana カタカナを使用してください")
    end
    it "surname_kanaとfirst_name_kanaは全角カタカナでの入力でないと登録できない" do
      @user.surname_kana = "花丸"
      @user.first_name_kana = "ハナマル"
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname kana カタカナを使用してください")
    end
   end
  end
end
