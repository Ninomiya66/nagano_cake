class RenameCountColumnToOrderDetails < ActiveRecord::Migration[6.1]

  def change

    rename_column :order_details, :count, :amount

  end
end
