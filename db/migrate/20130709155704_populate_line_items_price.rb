class PopulateLineItemsPrice < ActiveRecord::Migration
  def up
    LineItems.all.each do |lineitem|
      product_price = Product.price.where(:product_id => lineitem.product_id)
      lineitem.price = product_price
      lineitem.save
    end
  end

  def down
  end
end
