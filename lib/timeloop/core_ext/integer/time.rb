class Integer
  
  def months
    30 * self.days
  end
  alias :month :months

  def years
    365.25 * self.days
  end
  alias :year :years
end