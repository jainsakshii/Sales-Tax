$shop = { "book" => 12.49, "music CD" => 14.99, "chocolate bar" => 0.85,
  "imported chocolate" => 10.00, "imported perfume" => 47.50,"bottle perfume" => 18.99,
  "headache pills" => 9.75,"burger" => 19.00 }       
  

class Display
  def initialize
    puts `clear`
    puts "Welcome to our shop!!"
    puts "Mention the item you want to shop!"
    $shop.each { |k, v| puts " #{k}: #{v} " }
    puts "--------------------------------------"
  end
end

class Bill
  def self.bill(quant_array, billing)
    updated_bill = {}
    i = 0
    billing.each do |key, value|
      updated_bill[key] = (value.to_f * quant_array[i].to_f)
      i += 1
    end
    return updated_bill
  end
end

class Taxing
  attr_accessor :updated_bill
  def initialize(bill)
    @updated_bill = bill
  end

  def taxing
    final_bill = {}
    sales_tax = 0
    total_tax = 0
    @updated_bill.each do |key, value|
      if(key == "music CD" || key == "bottle perfume" ) 
        sales_tax += (0.1 * value.to_f)
        final_bill[key] = value.to_f + (0.1 * value.to_f)
      elsif (key == "imported perfume")
        sales_tax += (0.15 * value.to_f)
        final_bill[key] = value.to_f + (0.15 * value.to_f)
      elsif (key == "imported chocolate")
        sales_tax += (0.05 * value.to_f)
        final_bill[key] = value.to_f + (0.05 * value.to_f)
      else
        final_bill[key] = value.to_f
      end
    end
    final_bill.each do |key,value|
      total_tax += value.to_f
    end
    puts "_________FINAL RECEIPT_________"
    final_bill.each { |k, v| puts "#{k}: #{v}" }
    puts ("Total Tax: #{total_tax.round(2)}")
    puts ("Sales Tax: #{(sales_tax*20).round / 20.0}")
  end
end
  
def taking_input
  quant_array = Array.new
  billing = {}
  puts "Enter Number of Products you want to buy?"
  num = gets.chomp().to_i
  for i in 0..num-1
    puts "Enter name of Item: "
    item = gets.chomp()
    if $shop.has_key? (item)
      puts "Enter Quantities of #{item}"
      quantity = gets.chomp()
      quant_array.push(quantity)
      billing.store(item, $shop[item])
    else 
      puts "Invalid Item, enter correct name. "
    end
  end
  updated_bill = Bill.bill_calc(quant_array, billing)
  tax = Taxing.new(updated_bill)
  tax.taxing
end

display = Display.new
taking_input