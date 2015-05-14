class Employee
  attr_reader :name, :reviews
  attr_accessor :salary, :satisfactory
  def initialize(name:, email:"", phone_number: 000-000-0000, salary: 0)
    @name = name
    @salary = salary
    @reviews = []
    @satisfactory = nil
  end

  def add_review(text)
    @reviews << text
  end

  def is_satisfactory(boolean)
    @satisfactory = boolean
  end

  def give_raise(amount)
    @salary += amount
  end
end
