require_relative "../views/customers_view"
require_relative "../models/customer"

class CustomersController

  def initialize(customer_repo)
    @customer_repo = customer_repo
    @view = CustomersView.new
  end

  def add
    # ask the user for meals name
    name = @view.ask_for('name')
    # ask the user for meals price
    address = @view.ask_for('address')
    # create the meal
    customer = Customer.new(name: name, address: address)
    # store it in repo!
    # the ID is goint to be added on the create method on the repo!!
    @customer_repo.create(customer)
    #  list all my meals
    @view.list(@customer_repo.all)
  end

  def list
    @view.list(@customer_repo.all)
  end

end
