class Array
  def add_condition(condition, conjunction='and')
    if condition.is_a? Array
      if self.empty?
        condition.each { |c| self << c }
      else
        self[0] += " #{conjunction} " + condition.shift
        condition.each { |c| self << c }
      end
    elsif condition.is_a? String
      self[0] += " #{conjunction} " + condition
    else
      raise "don't know how to handle this condition type"
    end
    self
  end
end
