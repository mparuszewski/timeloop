require 'timeloop/core_ext'
require 'timeloop/version'

module Kernel
  # Provides a way to execute a block of code periodically. The
  # runtime of the block is taken in to account so a delay in one run
  # does not impact the start times of future runs.
  #
  # Yields Integer index of the iteration to the provide block every `period`.
  def every(period, opts = {})
    maximum = parse_maximum_value(opts.fetch(:maximum, Float::INFINITY))
    frequency = parse_frequency(period)

    i = -1
    loop do
      run_started_at = Time.now
      i += 1

      yield(i) if block_given?

      break if i+1 >= maximum
      sleep time_til_next_run(frequency, Time.now - run_started_at)
    end
  end

  private

  def time_til_next_run(frequency, current_run_duration)
    [0, frequency - current_run_duration].max
  end

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
    when Integer, Float::INFINITY
      maximum
    else
      fail ArgumentError.new('wrong type of argument (should be an Enumerator or Integer)')
    end
  end
end

class Object
  include Kernel
end
