RSpec.describe Stack do
  subject(:stack) { Stack.new }

  describe "#push" do
    it "pushes to the stack" do
      stack.push "foo"
      expect(stack.length).to eq(1)
    end
  end

  describe "#peek" do
    it "returns the top of the stack without modifying it" do
      stack.push "foo"

      expect {
        expect(stack.peek).to eq("foo")
      }.to_not change { stack.length }
    end

    context "with a position" do
      it "returns the position of stack" do
        stack.push "A"
        stack.push "B"
        stack.push "C"

        expect(stack.peek(1)).to eq("B")
      end

      context "when out of bounds" do
        it "returns an error" do
          expect {
            stack.peek(123)
          }.to raise_error(described_class::OutOfBoundsError)
        end
      end
    end
  end

  describe "#length" do
    it "starts at 0" do
      expect(stack.length).to eq(0)
    end
  end
end
