class AddNameToBikes < ActiveRecord::Migration[7.1]
  def change
    add_column :bikes, :name, :string
  end
end
