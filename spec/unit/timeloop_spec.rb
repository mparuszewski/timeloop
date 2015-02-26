require 'spec_helper'

describe "Kernel#every" do
  it "stops looping at maximum number of time" do
    expect{|b| every((0.0001).second, maximum: 3, &b)}.to yield_control.exactly(3).times
  end

  it "provides run count on iteration" do
    expect{|b| every((0.0001).second, maximum: 3, &b)}.to yield_successive_args(0, 1, 2)
  end

  it "loops forever if maximum is not specified" do
    expect {
      Timeout.timeout(1) do
        every(0.1) {  }
      end
    }.to raise_error(Timeout::Error)
  end

  it "invokes block on the specified period" do
    start_times = []
    every(0.1, maximum: 3) { start_times << Time.now }

    expect(start_times[1] - start_times[0]).to be_within(0.01).of(0.1)
    expect(start_times[2] - start_times[1]).to be_within(0.01).of(0.1)
  end

  it "invokes block on the specified period even if block takes a (relatively) long time" do
    start_times = []
    every(0.1, maximum: 3) { start_times << Time.now; sleep 0.08 }

    expect(start_times[1] - start_times[0]).to be_within(0.01).of(0.1)
    expect(start_times[2] - start_times[1]).to be_within(0.01).of(0.1)
  end

  it "invokes block continuously without any delays if block takes longer than period" do
    start_times = []
    every(0.1, maximum: 3) { start_times << Time.now; sleep 0.18 }

    expect(start_times[1] - start_times[0]).to be_within(0.01).of(0.18)
    expect(start_times[2] - start_times[1]).to be_within(0.01).of(0.18)
  end

  it "understands english time periods" do
    expect{every(:second, maximum: 1) {}}.not_to raise_error
  end

  it "understands numeric time periods" do
    expect{every(1, maximum: 1) {}}.not_to raise_error
  end

end
