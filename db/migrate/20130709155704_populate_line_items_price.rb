class PopulateLineItemsPrice < ActiveRecord::Migration
  def self.up
    LineItem.all.each do |lineitem|
      lineitem.update_attributes :price => lineitem.product.price
    end
  end

  def self.down
  end
end
