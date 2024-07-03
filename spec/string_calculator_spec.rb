require 'rspec'
require './lib/string_calculator'
describe "It should calculate sum of the number in a string" do

  context "Check .add method" do
    context " Check for postive number and other characters" do
      it "should return 0 if empty string is provide" do
        expect(StringCalculator.add("")).to eq(0)
      end

      it "should return 4" do
        expect(StringCalculator.add("4")).to eq(4)
      end

      it "should return 6 for input 1,5" do
        expect(StringCalculator.add("1,5")).to eq(6)
      end

      it "should return sum for string with new line operator" do
        expect(StringCalculator.add("1\n2,3")).to eq(6)
      end

      it "should return sum for custom delimiter" do
        expect(StringCalculator.add("//:\n2:3:4")).to eq(9)
      end
    end

    context "It should raise error on negative numbers" do
      it "should not process negative numbers" do
        expect(StringCalculator.add("1,-1,-2,4")).to raise_error(RuntimeError)
        expect(StringCalculator.add("1,-1,-2,4")).to raise_error("Negative number not allowed: -1,-2")
      end
    end
  end

end