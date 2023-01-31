class MealsView

  def ask_for(stuff)
    puts "What's the #{stuff} of your meal?"
    gets.chomp
  end

  def list(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1} - #{meal.name}  $#{meal.price}"
    end
  end
end
