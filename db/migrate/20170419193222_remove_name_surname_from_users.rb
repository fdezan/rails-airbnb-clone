class RemoveNameSurnameFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :name, :string
    remove_column :users, :surname, :string
  end
end