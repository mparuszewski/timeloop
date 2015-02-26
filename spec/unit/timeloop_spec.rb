require 'spec_helper'
require 'logger'

describe "Kernel#every" do
  it "calls block every period" do
    expect{|b| every((0.0001).second, maximum: 3, &b)}.to yield_control.exactly(3).times
  end
end


describe Timeloop do
  describe ".new" do
    it "accepts all the options" do
      expect(described_class.new(period: 0.1, maximum: 3, logger: a_logger))
        .to be_kind_of described_class
    end

    it "works with minimal options set" do
      expect(described_class.new(period: 0.1))
        .to be_kind_of described_class
    end

    it "understands english periods" do
      expect(described_class.new(period: :second))
        .to be_kind_of described_class
    end

    it "rejects bogus periods" do
      expect{described_class.new(period: :circle)}
        .to raise_error ArgumentError
    end
  end

  subject { described_class.new(period: 0.1, maximum: 3, logger: a_logger) }

  describe "logging" do
    it "records sleeps" do
      subject.loop {}

      expect(a_logger).to have_received(:debug).with(/sleeping/i).exactly(2)
    end

    it "records starts" do
      subject.loop {}

      expect(a_logger).to have_received(:debug).with(/starting/i).exactly(3)
      expect(a_logger).to have_received(:debug).with(/starting.*0/i)
      expect(a_logger).to have_received(:debug).with(/starting.*1/i)
      expect(a_logger).to have_received(:debug).with(/starting.*2/i)
    end
  end

  it "invokes block on the specified period" do
    start_times = []
    subject.loop { start_times << Time.now }

    expect(start_times[1] - start_times[0]).to be_within(0.01).of(0.1)
    expect(start_times[2] - start_times[1]).to be_within(0.01).of(0.1)
  end

  it "invokes block on the specified period even if block takes a (relatively) long time" do
    start_times = []
    subject.loop { start_times << Time.now; sleep 0.08 }

    expect(start_times[1] - start_times[0]).to be_within(0.01).of(0.1)
    expect(start_times[2] - start_times[1]).to be_within(0.01).of(0.1)
  end

  it "invokes block continuously without any delays if block takes longer than period" do
    start_times = []
    subject.loop { start_times << Time.now; sleep 0.18 }

    expect(start_times[1] - start_times[0]).to be_within(0.01).of(0.18)
    expect(start_times[2] - start_times[1]).to be_within(0.01).of(0.18)
  end

  it "provides run count on iteration" do
    expect{|b| subject.loop(&b)}.to yield_successive_args(0, 1, 2)
  end

  context "w/ max" do
    specify { expect(subject.to_s).to eq "#<Timeloop period=0.1, max=3>" }

    it "stops looping at maximum number of time" do
      expect{|b| subject.loop(&b)}.to yield_control.exactly(3).times
    end
  end

  context "w/o max" do
    subject { described_class.new(period: 0.1) }

    specify { expect(subject.to_s).to eq "#<Timeloop period=0.1>" }

    it "loops forever" do
      expect {
        Timeout.timeout(1) do
          subject.loop {  }
        end
      }.to raise_error(Timeout::Error)
  end
  end

  # Background

  let(:a_logger) { spy(instance_double(Logger)) }
end
