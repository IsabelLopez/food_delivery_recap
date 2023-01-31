require 'csv'
require_relative "../models/meal.rb"

class MealRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @meals = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def create(meal)
    meal.id = @next_id
    @meals << meal
    @next_id += 1
    save_csv
  end

  def all
    @meals
  end

  def find(id)
    # looking for meal by ID not index!!!
    @meals.find {|meal| meal.id == id}
  end


  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      # change price to integer!!
      row[:price] = row[:price].to_i
      row[:id] = row[:id].to_i
      @meals << Meal.new(row)
    end
    @next_id = @meals.last.id + 1 unless @meals.empty?
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      # csv << ['id', 'name', 'price']
      csv << %w[id name price]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end
