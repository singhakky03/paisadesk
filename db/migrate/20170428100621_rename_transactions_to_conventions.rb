class RenameTransactionsToConventions < ActiveRecord::Migration
  def change
    rename_table :transactions, :conventions
  end
end
