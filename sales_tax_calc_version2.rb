$sales_tax = 0
$bought_item = {}


class Display
  def initialize
    puts `clear`
    puts "Welcome to our shop!!"
    puts "Mention the item you want to shop!"
    puts "First mention the quantity, product name then price."
    puts "--------------------------------------"
  end
end


def product_name(name)
  temp = ""
  name.each {|n| temp +=n+" "}            
  temp[0...-1]
end


class Input 
  def self.taking_input
    puts "Enter Number of Product"
    num = gets.chomp().to_i
    for i in 0..num-1
      product = gets.chomp.split
      price = product[-1].to_f
      keyword = product.index("at")
      name = product_name(product[1...keyword])
      $bought_item[name] = price
    end
  end
end 


class TaxCalculator
  def self.calculation
    $bought_item.each do |key,value|
      if(key == "music CD" || key == "bottle perfume" ) 
        puts "calc tax"
        $sales_tax += (0.1 * value.to_f)
        $bought_item[key] = value.to_f + (0.1 * value.to_f)
      elsif (key == "imported perfume")
        puts "calc tax"
        $sales_tax += (0.15 * value.to_f)
        $bought_item[key] = value.to_f + (0.15 * value.to_f)
      elsif (key == "imported chocolate")
        puts "calc tax"
        $sales_tax += (0.05 * value.to_f)
        $bought_item[key] = value.to_f + (0.05 * value.to_f)
      else
        puts "no tax"
        $bought_item[key] = value.to_f
      end
    end
  return $bought_item
  end
end


class Receipt
  def self.final_output
    TaxCalculator.calculation
    total_tax = 0
    $bought_item.each do |key,value|
      total_tax += value.to_f
    end
    puts "_________FINAL RECEIPT_________"
    $bought_item.each { |k, v| puts "#{k}: #{v}" }
    puts ("Total Tax: #{total_tax.round(2)}")
    puts ("Sales Tax: #{($sales_tax*20).round / 20.0}")
  end
end

display = Display.new
Input.taking_input
Receipt.final_output

    
