require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "cart should create a new line when adding a new product" do
    cart = carts(:cart1)
    product1 = products(:one)
    item = cart.add_product(product1.id, product1.price)
    assert_equal(1, cart.line_items.length)
    #Add a different product to the cart
    product2 = products(:two)
    cart.add_product(product2.id, product2.price)
    assert_equal(2, cart.line_items.length)
    assert_equal(19.98, cart.total_price)
  end
  
  test "cart should update existing line item when adding duplicate product" do
    cart = carts(:cart2)
    product3 = products(:one)
    3.times do
      cart.add_product(product3.id, product3.price).save!
    end
    testitem = LineItem.where(:product_id => product3.id).first
    assert_equal(3, testitem.quantity, "quantity not increased with duplicate product")
    assert_equal(9.99, testitem.price, "price isn't right in line_items")
    assert_equal(1, cart.line_items.length, "duplicate line item produced - oops")
  end
  
  test "price should be passed to line_items from products" do
    cart = carts(:cart3)
    product = products(:ruby)
    lineitem = cart.add_product(product.id, product.price)
    assert_equal(lineitem.price, product.price, "line item did not save price")
  end
end
