class Backstage
  def initialize(items)
    @items = items
  end

  def update_quality(item)
    if item.quality < 50
      item.quality += 1
      item.quality += 1 if item.sell_in < 11
      item.quality += 1 if item.sell_in < 6
    end
    item.sell_in -= 1
    item.quality = 0 if item.sell_in < 0
  end
end