require 'byebug'
class Employee
  attr_reader :name, :reviews, :parsed
  attr_accessor :salary, :satisfactory, :positive_words, :negative_words
  def initialize(name:, email:"", phone_number: 000-000-0000, salary: 0)
    @name = name
    @salary = salary
    @reviews = []
    @parsed = Array.new
    @satisfactory = nil
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
      sentances = review.split(/\.|:/)
      sentances.each {|s| @parsed << s}
    end
    return true
  end

  def analyze(sentance)
    # byebug
    hold_positive = []
    hold_negative = []
    search_param = sentance
    p @negative_words
    hold_positive << @positive_words.select { |word| search_param.scan(/#{word}/).length > 0 ? true : false }
    hold_negative << @negative_words.select { |word| search_param.scan(/#{word}/).length > 0 ? true : false }
    # byebug
    return hold_positive.flatten.length-hold_negative.flatten.length
  end

  def calculate_score
    total_score = 0
    calculator = lambda{ |sentance| total_score += yield (sentance) }
    @parsed.each &calculator
    if total_score <= 0
      @satisfactory = false
    else
      @satisfactory = true
    end
    return total_score
  end

  def add_trigger_word(word:,positive:)
    # byebug
    if positive
      @positive_words << word
    else
      @negative_words << word
    end
  end


end
