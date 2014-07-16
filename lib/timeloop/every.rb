module Timeloop
  module Every

    def every(value, opts = {})
      maximum = parse_maximum_value(opts.fetch(:maximum)) if opts.key? :maximum
      frequency = parse_frequency(value)

      if maximum.nil?
        i = 0
        loop do
          yield(i) if block_given?
          sleep frequency
          
          i += 1
        end
      else
        maximum.times do |i|
          yield(i) if block_given?
          sleep frequency
        end
      end
    end

    private

    def parse_frequency(frequency)
      case frequency
      when Numeric
        frequency
      when :second, 'second'
        1.second
      when :minute, 'second'
        1.minute
      when :hour, 'hour'
        1.hour
      when :day, 'day'
        1.day
      when :month, 'month'
        1.month
      when :year, 'year'
        1.year
      else
        fail ArgumentError.new('wrong type of argument (should be a Numeric, Symbol or String)')
      end
    end

    def parse_maximum_value(maximum)
      case maximum
      when Enumerator
        maximum.count
      when Integer
        maximum
      else
        fail ArgumentError.new('wrong type of argument (should be an Enumerator or Integer)')
      end
    end
  end
end