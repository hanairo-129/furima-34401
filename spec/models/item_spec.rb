require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end


  context "商品が出品できる時" do

    it 'すべての項目が含まれていれば出品できる' do
      expect(@item).to be_valid
     end

    end
    
  context "商品が出品できない時" do

    it "imageが空だと出品できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "item_nameが入力されていないと出品できない" do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end

    it "detailsが入力されていないと出品できない" do
      @item.details = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Details can't be blank")
    end

    it "category_idが選択されていないと出品できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Select")
    end

    it "status_idが選択されていないと出品できない" do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status Select")
    end

    it "delivery_idが選択されていないと出品できない" do
      @item.delivery_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery Select")
    end

    it "area_idが選択されていないと出品できない" do
      @item.area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Area Select")
    end

    it "post_time_idが選択されていないと出品できない" do
      @item.post_time_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Post time Select")
    end

    it "priceが300円未満だと出品できない" do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end

    it "priceが10000000円以上だと出品できない" do
      @item.price = 12000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end

    it "priceが全角文字だと出品できない" do
      @item.price = '１００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end

    it "priceが半角英数混合だと出品できない" do
      @item.price = '123abc'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end
  end
end
