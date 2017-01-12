class CreateUserGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :user_groups do |t|
      t.references :group
      t.references :user
      t.timestamps
    end
  end
end
