class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :item_name,   null: false, default: ""
      t.text        :details,     null: false
      t.integer     :category_id, null: false
      t.integer     :status_id,   null: false
      t.integer     :delivery_id, null: false
      t.integer     :area_id,     null: false
      t.integer     :post_time_id,     null: false
      t.integer     :price,       null: false
      t.references  :user,        foreign_key: true
      t.timestamps  null: false
    end
  end
end
