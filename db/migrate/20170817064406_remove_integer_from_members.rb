class RemoveIntegerFromMembers < ActiveRecord::Migration[5.0]
  def change
    remove_column :members, :integer, :string
    remove_column :members, :t.string, :string
  end
end
