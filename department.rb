require "byebug"
class Department
  attr_reader :name, :employees
  def initialize(name)
    @name = name
    @employees = {}
  end

  def add_employee(employee)
    key = employee.name
    @employees[key] = employee
  end

  def total_dep_salaries
    total_salaries = 0
    @employees.each do |key, object|
      total_salaries += object.salary.to_f
    end
    return total_salaries
  end
#Ask Mason about way to get at length
  def give_raises (amount)
    @employees  .select {|name, emp| yield(emp)}
                .each do |name, emp|
                  emp.salary += amount/2
    end
  end


end
