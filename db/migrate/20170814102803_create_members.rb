class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :user_id
      t.string :integer
      t.string :group_id
      t.string :integer

      t.timestamps
    end
  end
end