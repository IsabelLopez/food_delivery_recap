require_relative "../views/meals_view"
require_relative '../models/meal'

class MealsController
  def initialize(meal_repo)
    @meal_repo = meal_repo
    @view = MealsView.new
  end

  def add
    # ask the user for meals name
    name = @view.ask_for('name')
    # ask the user for meals price
    price = @view.ask_for('price').to_i
    # create the meal
    meal = Meal.new(name: name, price: price)
    # store it in repo!
    @meal_repo.create(meal)
    #  list all my meals
    @view.list(@meal_repo.all)
  end

  def list
    @view.list(@meal_repo.all)
  end

end
