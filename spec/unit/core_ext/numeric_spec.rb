require 'spec_helper'

describe Numeric do
  describe '#miliseconds' do
    it 'returns 0 milisecond as seconds' do
      seconds = 0
      expect(0.milisecond).to  eq(seconds)
      expect(0.miliseconds).to eq(seconds)
    end

    it 'returns 1 milisecond as seconds' do
      seconds = 1 / 1000.0
      expect(1.milisecond).to  eq(seconds)
      expect(1.miliseconds).to eq(seconds)
    end

    it 'returns 3 miliseconds as seconds' do
      seconds = 3 / 1000.0
      expect(3.milisecond).to  eq(seconds)
      expect(3.miliseconds).to eq(seconds)
    end

    it 'returns 75.6 miliseconds as seconds' do
      seconds = 75.6 / 1000.0
      expect(75.6.milisecond).to  eq(seconds)
      expect(75.6.miliseconds).to eq(seconds)
    end

    it 'returns -2 miliseconds as seconds' do
      seconds = -2 / 1000.0
      expect(-2.milisecond).to  eq(seconds)
      expect(-2.miliseconds).to eq(seconds)
    end

    it 'returns -2.7 miliseconds as seconds' do
      seconds = -2.7 / 1000.0
      expect(-2.7.milisecond).to  eq(seconds)
      expect(-2.7.miliseconds).to eq(seconds)
    end
  end

  describe '#seconds' do
    it 'returns 0 second as seconds' do
      seconds = 0
      expect(0.second).to  eq(seconds)
      expect(0.seconds).to eq(seconds)
    end

    it 'returns 1 second as seconds' do
      seconds = 1
      expect(1.second).to  eq(seconds)
      expect(1.seconds).to eq(seconds)
    end

    it 'returns 3 seconds as seconds' do
      seconds = 3
      expect(3.second).to  eq(seconds)
      expect(3.seconds).to eq(seconds)
    end

    it 'returns 75.6 seconds as seconds' do
      seconds = 75.6
      expect(75.6.second).to  eq(seconds)
      expect(75.6.seconds).to eq(seconds)
    end

    it 'returns -2 seconds as seconds' do
      seconds = -2
      expect(-2.second).to  eq(seconds)
      expect(-2.seconds).to eq(seconds)
    end

    it 'returns -2.7 seconds as seconds' do
      seconds = -2.7
      expect(-2.7.second).to  eq(seconds)
      expect(-2.7.seconds).to eq(seconds)
    end
  end

  describe '#minutes' do
    it 'returns 0 minute as seconds' do
      seconds = 0 * 60
      expect(0.minute).to  eq(seconds)
      expect(0.minutes).to eq(seconds)
    end

    it 'returns 1 minute as seconds' do
      seconds = 1 * 60
      expect(1.minute).to  eq(seconds)
      expect(1.minutes).to eq(seconds)
    end

    it 'returns 3 seconds as seconds' do
      seconds = 3 * 60
      expect(3.minute).to  eq(seconds)
      expect(3.minutes).to eq(seconds)
    end

    it 'returns 75.6 minutes as seconds' do
      seconds = 75.6 * 60
      expect(75.6.minute).to  eq(seconds)
      expect(75.6.minutes).to eq(seconds)
    end

    it 'returns -2 minutes as seconds' do
      seconds = -2 * 60
      expect(-2.minute).to  eq(seconds)
      expect(-2.minutes).to eq(seconds)
    end

    it 'returns -2.7 minutes as seconds' do
      seconds = -2.7 * 60
      expect(-2.7.minute).to  eq(seconds)
      expect(-2.7.minutes).to eq(seconds)
    end
  end

  describe '#hours' do
    it 'returns 0 hour as seconds' do
      seconds = 0 * 60 * 60
      expect(0.hour).to  eq(seconds)
      expect(0.hours).to eq(seconds)
    end

    it 'returns 1 hour as seconds' do
      seconds = 1 * 60 * 60
      expect(1.hour).to  eq(seconds)
      expect(1.hours).to eq(seconds)
    end

    it 'returns 3 seconds as seconds' do
      seconds = 3 * 60 * 60
      expect(3.hour).to  eq(seconds)
      expect(3.hours).to eq(seconds)
    end

    it 'returns 75.6 hours as seconds' do
      seconds = 75.6 * 60 * 60
      expect(75.6.hour).to  eq(seconds)
      expect(75.6.hours).to eq(seconds)
    end

    it 'returns -2 hours as seconds' do
      seconds = -2 * 60 * 60
      expect(-2.hour).to  eq(seconds)
      expect(-2.hours).to eq(seconds)
    end

    it 'returns -2.7 hours as seconds' do
      seconds = -2.7 * 60 * 60
      expect(-2.7.hour).to  eq(seconds)
      expect(-2.7.hours).to eq(seconds)
    end
  end

  describe '#days' do
    it 'returns 0 day as seconds' do
      seconds = 0 * 60 * 60 * 24
      expect(0.day).to  eq(seconds)
      expect(0.days).to eq(seconds)
    end

    it 'returns 1 day as seconds' do
      seconds = 1 * 60 * 60 * 24
      expect(1.day).to  eq(seconds)
      expect(1.days).to eq(seconds)
    end

    it 'returns 3 seconds as seconds' do
      seconds = 3 * 60 * 60 * 24
      expect(3.day).to  eq(seconds)
      expect(3.days).to eq(seconds)
    end

    it 'returns 75.6 days as seconds' do
      seconds = 75.6 * 60 * 60 * 24
      expect(75.6.day).to  eq(seconds)
      expect(75.6.days).to eq(seconds)
    end

    it 'returns -2 days as seconds' do
      seconds = -2 * 60 * 60 * 24
      expect(-2.day).to  eq(seconds)
      expect(-2.days).to eq(seconds)
    end

    it 'returns -2.7 days as seconds' do
      seconds = -2.7 * 60 * 60 * 24
      expect(-2.7.day).to  eq(seconds)
      expect(-2.7.days).to eq(seconds)
    end
  end

  describe '#weeks' do
    it 'returns 0 week as seconds' do
      seconds = 0 * 60 * 60 * 24 * 7
      expect(0.week).to  eq(seconds)
      expect(0.weeks).to eq(seconds)
    end

    it 'returns 1 week as seconds' do
      seconds = 1 * 60 * 60 * 24 * 7
      expect(1.week).to  eq(seconds)
      expect(1.weeks).to eq(seconds)
    end

    it 'returns 3 seconds as seconds' do
      seconds = 3 * 60 * 60 * 24 * 7
      expect(3.week).to  eq(seconds)
      expect(3.weeks).to eq(seconds)
    end

    it 'returns 75.6 weeks as seconds' do
      seconds = 75.6 * 60 * 60 * 24 * 7
      expect(75.6.week).to  eq(seconds)
      expect(75.6.weeks).to eq(seconds)
    end

    it 'returns -2 weeks as seconds' do
      seconds = -2 * 60 * 60 * 24 * 7
      expect(-2.week).to  eq(seconds)
      expect(-2.weeks).to eq(seconds)
    end

    it 'returns -2.7 weeks as seconds' do
      seconds = -2.7 * 60 * 60 * 24 * 7
      expect(-2.7.week).to  eq(seconds)
      expect(-2.7.weeks).to eq(seconds)
    end
  end
end