require 'byebug'
class Employee
  attr_reader :name, :reviews, :parsed
  attr_accessor :salary, :satisfactory
  def initialize(name:, email:"", phone_number: 000-000-0000, salary: 0)
    @name = name
    @salary = salary
    @reviews = []
    @satisfactory = nil
    @parsed = []
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

  def parse_review
    @reviews.each do |review|
      #byebug
      @parsed << review.split(/\.|:/)
    end
    return true
  end

end
