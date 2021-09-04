require 'item'
require 'normal'
require 'conjured'
require 'brie'
require 'sulfuras'
require 'backstage'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      case item.name
      when "Conjured"
        Conjured.new(item).update_quality(item)
      when "Aged Brie"
        Brie.new(item).update_quality(item)
      when "Backstage passes to a TAFKAL80ETC concert"
        Backstage.new(item).update_quality(item)
      when "Sulfuras, Hand of Ragnaros"
        Sulfuras.new(item).update_quality(item)
      else
        Normal.new(item).update_quality(item)
      end
    end
  end
end
