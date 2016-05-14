class AddShooterToUsers < ActiveRecord::Migration
  def change
    add_column :users, :shooter, :string
  end
end
