# frozen_string_literal: true

RSpec.describe DeepFreeze do
  include DeepFreeze
  it "freezes arrays" do
    array = [1, 2, 3]
    deep_freeze(array)
    expect(array.frozen?).to be true
    expect(array.all?(&:frozen?)).to be true
  end
  it "freezes hashes" do
    hash = {a: 1, b: 2, c: {d: 3, e: 4}}
    deep_freeze(hash)
    expect(hash.frozen?).to be true
    expect(hash.keys.all?(&:frozen?)).to be true
    expect(hash.values.all?(&:frozen?)).to be true
    expect(hash[:c].keys.all?(&:frozen?)).to be true
  end
  it "freezes strings" do
    string = "string"
    deep_freeze(string)
    expect(string.frozen?).to be true
  end
  it "freezes symbols" do
    symbol = :symbol
    deep_freeze(symbol)
    expect(symbol.frozen?).to be true
  end
  it "freezes true booleans" do
    boolean = true
    deep_freeze(boolean)
    expect(boolean.frozen?).to be true
  end
  it "freezes false booleans" do
    boolean = false
    deep_freeze(boolean)
    expect(boolean.frozen?).to be true
  end

  it "raises an error trying to freeze unsupported types" do
    unsupported_type = Object.new
    expect {deep_freeze(unsupported_type)}.to raise_error(RuntimeError)
  end

end
