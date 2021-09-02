class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality_normal(item)
    item.sell_in -= 1
      if item.quality > 0
          item.quality -= 1
          item.quality -= 1 if item.sell_in < 0 
      end
  end

  def update_quality_brie(item)
    item.sell_in -= 1
    item.quality += 1 if item.quality < 50
  end

  def update_quality_backstate(item)
    if item.quality < 50
      item.quality += 1
      item.quality += 1 if item.sell_in < 11
      item.quality += 1 if item.sell_in < 6
    end
    item.sell_in -= 1
    item.quality = 0 if item.sell_in < 0
  end
  

  def update_quality()
    @items.each do |item|
      if item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert" && item.name != "Sulfuras, Hand of Ragnaros"
        update_quality_normal(item)
      elsif item.name == "Aged Brie"
        update_quality_brie(item)
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
        update_quality_backstate(item)
      end
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
