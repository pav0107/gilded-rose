class Normal
  def initialize(items)
    @items = items
  end

  def update_quality(item)
    item.sell_in -= 1
      if item.quality > 0
          item.quality -= 1
          item.quality -= 1 if item.sell_in < 0 
      end
  end
end