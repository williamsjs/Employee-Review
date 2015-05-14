require "byebug"
class Department
  attr_reader :name, :employees, :total_salaries
  def initialize(name)
    @name = name
    @employees = {}
    @total_salaries = 0
  end

  def add_employee(employee)
    key = employee.name
    @employees[key] = employee
  end

  def total_dep_salaries
    @employees.each do |key, object|
      @total_salaries += object.salary.to_f
    end
  end

  def give_raises(employees:, percent:, all:false)
    if all == false
      @employees.each do |name, emp|
        emp.salary += emp.salary*percent/100
      end
    end
  end


end
