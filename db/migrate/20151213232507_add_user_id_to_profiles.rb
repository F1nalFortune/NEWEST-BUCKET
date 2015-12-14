class AddUserIdToProfiles < ActiveRecord::Migration
  def change
    change_table :profiles do |t|
      t.belongs_to :user
    end
  end
end
