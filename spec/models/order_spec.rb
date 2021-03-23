require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: user.id)
    @record_address = FactoryBot.build(:record_address, user_id: user.id, item_id: item.id)
    sleep(1)
  end

  context "商品が購入できる時" do

    it 'すべての項目が含まれていれば購入できる' do
      expect(@record_address).to be_valid
     end


    it 'building_nameがなくても購入できる' do
      @record_address.building_name = ''
      @record_address.valid?
      expect(@record_address).to be_valid
     end

  end
    
  context "商品が購入できない時" do

    it "postal_codeが入力されていないと購入できない" do
      @record_address.postal_code = ''
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it "postal_codeは-(ハイフン)が入力されていないと購入できない" do
      @record_address.postal_code = '1234567'
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("Postal code is invalid")
    end

    it "area_idが選択されていないと購入できない" do
      @record_address.area_id = 1
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("Area can't be blank")
    end

    it "cityが入力されていないと購入できない" do
      @record_address.city = ''
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("City can't be blank")
    end

    it "house_numberが選択されていないと出品できない" do
      @record_address.house_number = ''
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("House number can't be blank")
    end

    it "phone_numberが入力されていないと購入できない" do
      @record_address.phone_number = ''
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("Phone number is invalid")
    end

    it "phone_numberに数字以外が入力されていないと購入できない" do
      @record_address.phone_number = 'ABC'
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("Phone number is invalid")
    end

    it "phone_numberが11桁を超えると購入できない" do
      @record_address.phone_number = '123456789012'
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("Phone number is invalid")
    end

    it "tokenが入力されていないと購入できない" do
      @record_address.token = ''
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("Token can't be blank")
    end

    
  end
end