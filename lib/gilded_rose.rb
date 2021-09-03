class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name == "Conjured"
        conjured = Conjured.new(item)
        conjured.update_quality(item)
      elsif item.name == "Aged Brie"
        brie = Brie.new(item)
        brie.update_quality(item)
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
        backstage = Backstage.new(item)
        backstage.update_quality(item)
      elsif item.name == "Sulfuras, Hand of Ragnaros"
        backstage = Sulfuras.new(item)
        backstage.update_quality(item)
      else
        normal = Normal.new(item)
        normal.update_quality(item)
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

class Brie
  def initialize(items)
    @items = items
  end

  def update_quality(item)
    item.sell_in -= 1
    item.quality += 1 if item.quality < 50
  end
end

class Sulfuras
  def initialize(items)
    @items = items
  end

  def update_quality(item)
  end
end

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