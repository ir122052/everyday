class AddPetsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pets, :string
  end
end
