require 'item'

describe Item do
  describe "to_s" do
    it "returns the correct values" do
      item = Item.new("foo", 0, 0)
      expect(item.to_s).to eq("foo, 0, 0")
    end
  end
end