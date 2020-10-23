require_relative './part_1_solution.rb'

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  index = 0 
  
  coupon_cart = cart.each do |cart_item|
    coupons.each do |coupon_item|
      if cart_item[:item] === coupon_item[:item] && cart_item[:count] >= coupon_item[:num]
        new_count =  (cart_item[:count] -= coupon_item[:num])
        #cart_item[:count] = new_count
        if coupon_item[:item] + " W/COUPON" === cart_item[:item]
          cart_item[:count] += coupon_item[:num]
          cart_item[count] = new_count
        else 
        cart << {:item => cart_item[:item] + " W/COUPON",
        :price => (coupon_item[:cost] / coupon_item[:num]),
        :clearance => cart_item[:clearance], :count => coupon_item[:num]}
        #binding.pry
        end 
        #index += 1
        #coupon_cart
    #binding.pry
       end 
      end
       #index += 1
    end 
      #binding.pry
end
     
def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
  clearance_cart = cart.each do |grocery_item|
    #binding.pry 
    if grocery_item[:clearance] == true
      new_price = (grocery_item[:price] * 0.8).round(2)
      grocery_item[:price] = new_price
    end 
    #binding.pry 
  end
 #binding.pry
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
  
  consolidated_cart = consolidate_cart(cart)
  after_coupon_cart = apply_coupons(consolidated_cart, coupons)
  clearance_cart = apply_clearance(after_coupon_cart)
  binding.pry 
  final_price_array = []
  
  clearance_cart.each do |cart_item|
    final_price_array << cart_item[:price] * cart_item[:count]
    #binding.pry
  end 
  
  final_price = final_price_array.reduce(:+)
  
  if final_price > 100
    final_price = (final_price * 0.80).round(2)
  end 
  binding.pry
  
  
end
