class Conjured
  def initialize(items)
    @items = items
  end

  def update_quality(item)
    item.sell_in -= 1
      if item.quality > 0
          item.quality -= 2
          item.quality -= 2 if item.sell_in < 0 
      end
  end
end