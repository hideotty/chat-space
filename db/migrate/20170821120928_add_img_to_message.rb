class AddImgToMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :img, :text
  end
end
