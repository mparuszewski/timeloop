require 'spec_helper'

describe Integer do
  describe '#months' do
    it 'returns 0.month as seconds' do
      seconds = 0
      expect(0.month).to  eq(seconds)
      expect(0.months).to eq(seconds)
    end

    it 'returns 1 month as seconds' do
      seconds = 1 * 30 * 24 * 60 * 60
      expect(1.month).to  eq(seconds)
      expect(1.months).to eq(seconds)
    end

    it 'returns 3 months as seconds' do
      seconds = 3 * 30 * 24 * 60 * 60
      expect(3.month).to  eq(seconds)
      expect(3.months).to eq(seconds)
    end

    it 'returns -2 months as seconds' do
      seconds = -2 * 30 * 24 * 60 * 60
      expect(-2.month).to  eq(seconds)
      expect(-2.months).to eq(seconds)
    end
  end

  describe '#years' do
    it 'returns 0 years as seconds' do
      seconds = 0
      expect(0.year).to  eq(seconds)
      expect(0.years).to eq(seconds)
    end

    it 'returns 1 month as seconds' do
      seconds = 1 * 365.25 * 24 * 60 * 60
      expect(1.year).to  eq(seconds)
      expect(1.years).to eq(seconds)
    end

    it 'returns 3 years as seconds' do
      seconds = 3 * 365.25 * 24 * 60 * 60
      expect(3.year).to  eq(seconds)
      expect(3.years).to eq(seconds)
    end

    it 'returns -2 years as seconds' do
      seconds = -2 * 365.25 * 24 * 60 * 60
      expect(-2.year).to  eq(seconds)
      expect(-2.years).to eq(seconds)
    end
  end
end