class Brie
  def initialize(items)
    @items = items
  end

  def update_quality(item)
    item.sell_in -= 1
    item.quality += 1 if item.quality < 50
  end
end