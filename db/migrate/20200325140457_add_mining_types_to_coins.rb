class AddMiningTypesToCoins < ActiveRecord::Migration[5.2]
  def change
    add_column :coins, :mining_type, :string
  end
end
