class CreateBucketlists < ActiveRecord::Migration
  def change
    create_table :bucketlists do |t|
      t.string :location
      t.string :title
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
