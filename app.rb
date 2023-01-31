# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb

require_relative "router"
require_relative "./app/repositories/meal_repository"
require_relative './app/controllers/meals_controller'
require_relative "./app/repositories/customer_repository"
require_relative './app/controllers/customers_controller'

MEALS_CSV_FILE = File.join(__dir__, "data/meals.csv")
CUSTOMERS_CSV_FILE = File.join(__dir__, "data/customers.csv")

meal_repo = MealRepository.new(MEALS_CSV_FILE)
meals_controller = MealsController.new(meal_repo)

customer_repo = CustomerRepository.new(CUSTOMERS_CSV_FILE)
customers_controller = CustomersController.new(customer_repo)

router = Router.new(meals_controller, customers_controller)
router.run
