require 'rails_helper'
RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
      before do
        @user = FactoryBot.build(:user)
      end

    it "nick_nameが空だと登録できない" do
      @user.nick_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nick name can't be blank")
    end
    
    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '同じemailは登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    
    it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが半角英字のみの場合は登録できない' do
      @user.password = 'abcde'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが半角数字のみの場合は登録できない' do
      @user.password = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが全角の場合は登録できない' do
      @user.password = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "last_nameが空では登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "last_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.last_name = 'abe'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it "first_nameが空では登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it "last_name_readingが空では登録できない" do
      @user.last_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name reading can't be blank")
    end

    it "last_name_readingが全角(カタカナ)でなければ登録できない" do
      @user.last_name_reading = 'あいうえお阿部'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name reading is invalid")
    end

    it "first_nameが空では登録できない" do
      @user.first_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading can't be blank")
    end

    it "first_name_readingが全角(カタカナ)でなければ登録できない" do
      @user.last_name_reading = 'あいうえお太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name reading is invalid")
    end

    it "birthdayが空では登録できない" do
      user = User.new(birthday: "")
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end

    it 'passwordが7文字以上であれば登録できること' do
      @user.password = 'abc1234'
      @user.password_confirmation = 'abc1234'
      expect(@user).to be_valid
    end

    it 'passwordが6文字以下であれば登録できないこと' do
      @user.password = 'abc123'
      @user.password_confirmation = 'abc123'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 7 characters)')
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123abcd'
      @user.password_confirmation = 'abcd123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    

  end
end