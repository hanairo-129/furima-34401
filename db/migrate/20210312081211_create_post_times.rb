class CreatePostTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :post_times do |t|

      t.timestamps
    end
  end
end
