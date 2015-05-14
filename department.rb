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
#Ask Mason about way to get at length
  def give_raises (amount)
    @employees  .select {|name, emp| emp.satisfactory == true}
                .each do |name, emp|
                  emp.salary += amount/2
    end
  end


end
