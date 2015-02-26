require 'timeloop/core_ext'
require 'timeloop/version'

# Provides a way to execute a block of code periodically. The
# runtime of the block is taken in to account so a delay in one run
# does not impact the start times of future runs.
class Timeloop

  # Runs provided block periodically.
  #
  # Yields Integer index of the iteration to the provide block every `period`.
  def loop
    i = -1
    super() do
      run_started_at = Time.now
      i += 1
      logger.debug("#{to_s}: starting #{i}th run")
      yield(i) if block_given?

      break if i+1 >= max

      sleep til_next_start_time(Time.now - run_started_at)
             .tap{|s| logger.debug "#{to_s}: sleeping #{s} seconds until next run" }
    end
  end

  def to_s
    ["#<Timeloop period=#{period}",
     max < Float::INFINITY ? ", max=#{max}" : "",
     ">"].join
  end

  protected

  attr_reader :period, :max, :logger

  def initialize(opts)
    @period = parse_frequency(opts.fetch(:period))
    @max    = parse_maximum_value(opts.fetch(:maximum){opts.fetch(:max, Float::INFINITY)})
    @logger = opts.fetch(:logger) { NULL_LOGGER }
  end

  def til_next_start_time(current_run_duration)
    [0, period - current_run_duration].max
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

  # Useful to avoid conditionals in logging code.
  NULL_LOGGER = Class.new do
    def debug(*args); end
  end.new
end

module Kernel
  # Provides a way to execute a block of code periodically. The
  # runtime of the block is taken in to account so a delay in one run
  # does not impact the start times of future runs.
  #
  # Yields Integer index of the iteration to the provide block every `period`.
  def every(period, opts = {}, &blk)
    Timeloop.new(opts.merge(period: period)).loop(&blk)
  end

  private


end

class Object
  include Kernel
end
