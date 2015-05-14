require 'minitest/autorun'
require 'minitest/pride'

require "./employee.rb"
require "./department.rb"

class ReviewTest < Minitest::Test

  def test_classes_exist
    assert Employee
    assert Department
  end

  def test_classes_have_names
    assert_equal "engineering", Department.new("engineering").name
    assert_equal "Ryan", Employee.new(name:"Ryan").name
  end

  def test_employee_inputs
    assert Employee.new(name: "Freddy", email: "freddy@gmail.com", phone_number: 919-434-5612, salary: 55000)
  end

  def test_add_employee_to_department
    fred = Employee.new(name: "Freddy", email: "freddy@gmail.com", phone_number: 919-434-5612, salary: 55000)
    eng = Department.new("engineering")
    eng.add_employee(fred)
    assert eng.employees
  end

  def test_departments_have_employees
    fred = Employee.new(name: "Freddy", email: "freddy@gmail.com", phone_number: 919-434-5612, salary: 55000)
    eng = Department.new("engineering")
    eng.add_employee(fred)
    assert eng.employees.include?("Freddy")
  end

  def test_retrieve_info
    fred = Employee.new(name: "Freddy", email: "freddy@gmail.com", phone_number: 919-434-5612, salary: 55000)
    mary = Employee.new(name: "Mary", email: "mary@gmail.com", phone_number: 919-234-3662, salary: 70000)
    eng = Department.new("engineering")
    assert_equal "Freddy", fred.name
    assert_equal 70000, mary.salary
    assert_equal "engineering", eng.name
  end

  def test_total_salaries
    fred = Employee.new(name: "Freddy", email: "freddy@gmail.com", phone_number: 919-434-5612, salary: 55000)
    mary = Employee.new(name: "Mary", email: "mary@gmail.com", phone_number: 919-234-3662, salary: 70000)
    eng = Department.new("engineering")
    eng.add_employee(fred)
    eng.add_employee(mary)
    eng.total_dep_salaries
    assert_equal fred.salary+mary.salary, eng.total_salaries
    assert_equal 125000, eng.total_salaries

  end

  def test_add_review
    mary = Employee.new(name: "Mary", email: "mary@gmail.com", phone_number: 919-234-3662, salary: 70000)
    mary.add_review("this is some review text")
    assert mary.reviews.include?("this is some review text")
  end

  def test_employee_satisfactory?
    mary = Employee.new(name: "Mary", email: "mary@gmail.com", phone_number: 919-234-3662, salary: 70000)
    mary.is_satisfactory(true)
    assert mary.satisfactory
    fred = Employee.new(name: "Freddy", email: "freddy@gmail.com", phone_number: 919-434-5612, salary: 55000)
    fred.is_satisfactory(false)
    refute fred.satisfactory
  end

  def test_give_single_raise
    fred = Employee.new(name: "Freddy", email: "freddy@gmail.com", phone_number: 919-434-5612, salary: 55000)
    mary = Employee.new(name: "Mary", email: "mary@gmail.com", phone_number: 919-234-3662, salary: 70000)
    eng = Department.new("engineering")
    eng.add_employee(fred)
    eng.add_employee(mary)
    eng.give_raises(employees:[mary],percent:10)
    assert_equal 77000, mary.salary
  end
























end
