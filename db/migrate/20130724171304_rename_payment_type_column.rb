class RenamePaymentTypeColumn < ActiveRecord::Migration
  def up
    rename_column :payment_types, :type, :p_type
  end

  def down
  end
end
