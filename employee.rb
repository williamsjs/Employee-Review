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
    @positive_words = ["encourage","positive","well","good","improve","useful","value","pleasure","quick","willing","help","success","happy","responsive","effectiv","consistent","satisfied","impress","productiv","great","asset","enjoy","perfect","retain"]
    @negative_words = ["difficult", "confus", "negative", "inadequate","limit","fault","disagree","concern","slow","need","lack"]
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

  def analyze(sentance)
    hold_positive = []
    hold_negative = []
    @positive_words.each { |word|
      hold_positive << sentance.scan(/#{word}/)
    }
    @negative_words.each { |word|
      hold_negative << sentance.scan(/#{word}/)
    }
    return_array = [hold_positive.flatten,hold_negative.flatten,hold_positive.flatten.length - hold_negative.flatten.length]
    return return_array
  end

  def calculate_score
    
  end

end
