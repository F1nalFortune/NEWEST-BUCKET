class AddProfileIdToBucketlists < ActiveRecord::Migration
  def change
    change_table :bucketlists do |t|

      t.string :location
      t.string :title
      t.boolean :completed

      t.belongs_to :profile
    end
  end
end
