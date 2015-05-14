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
    assert eng.employees.include?(fred)
  end

  def test_retrieve_info
    fred = Employee.new(name: "Freddy", email: "freddy@gmail.com", phone_number: 919-434-5612, salary: 55000)
    mary = Employee.new(name: "Mary", email: "mary@gmail.com", phone_number: 919-234-3662, salary: 70000)
    eng = Department.new("engineering")
    assert_equal "Freddy", fred.name
    assert_equal 70000, mary.salary
    assert_equal "engineering", eng.name
  end
















end
