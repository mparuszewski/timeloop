class Numeric

  def miliseconds
    self/1000.0
  end
  alias :milisecond :miliseconds

  def seconds
    self
  end
  alias :second :seconds

  def minutes
    60 * self
  end
  alias :minute :minutes

  def hours
    60 * self.minutes 
  end
  alias :hour :hours

  def days
    24 * self.hours
  end
  alias :day :days

  def weeks
    7 * self.days
  end
  alias :week :weeks

end