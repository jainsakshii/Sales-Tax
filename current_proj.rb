$shop = { "book" => 12.49, "music CD" => 14.99, "chocolate bar" => 0.85,
  "imported choclate" => 10.00, "imported perfume" => 47.50,"bottle perfume" => 18.99,
  "headache pills" => 9.75,"burger" => 19.00 }

class Display
  def initialize
    puts "Welcome to Shop!!"
    puts "Mention the item you want to shop!"
    $shop.each { |k, v| puts "Items=#{k}, Price=#{v}" }
  end
end
def taking_input
  while (press)
    puts "Enter name of Item: "
    item = gets.chomp()
    if shop.has_key?(item)
      puts "Enter Quantities of #{item}"
      quantity = gets.chomp()
      quant_array.push(quantity.to_i)
      billing.store(item,shop[item])
      puts "Want to continue Shopping?(Y/N)"
      ans = gets.chomp()
      if ans == "N"
        puts "Thank you! Shop Again. Here is the receipt."
        press = 0
        updated_bill = bill(quant_array, billing)
        taxing(updated_bill)
        break 
      end  
    else 
      puts "Invalid Item, enter correct name. "
    end
def bill(quant_array, billing)
  updated_bill = {}
  i = 0
  billing.each do |key, value|
    updated_bill[key] = (value.to_f * quant_array[i].to_i)
    i += 1
  end
  return updated_bill
end
def taxing(updated_bill)
  final_bill = {}
  sales_tax = 0
  total_tax = 0
  updated_bill.each do |key, value|
    if(key == "music CD" || key == "bottle perfume" ) 
      sales_tax += (0.1 * value)
      final_bill[key] = value + (0.1 * value)
    elsif (key == "imported perfume")
      sales_tax += (0.15 * value)
      final_bill[key] = value + (0.15 * value)
    elsif (key == "imported chocolate")
      sales_tax += (0.10 * value)
      final_bill[key] = value + (0.10 * value)
    else
      final_bill[key] = value
    end
  end
  final_bill.each do |key,value|
    total_tax += value
  end
  puts (total_tax)
  puts ((sales_tax*20).round / 20.0)
  puts (final_bill)
end
display = Display.new
