class CustomersView

  def ask_for(stuff)
    puts "What's the #{stuff} of your customer?"
    gets.chomp
  end

  def list(customers)
     customers.each_with_index do |customer, index|
      puts "#{index + 1} - #{customer.name}: #{customer.address}"
    end
  end
end
