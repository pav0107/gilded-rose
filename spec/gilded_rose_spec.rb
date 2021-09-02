require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    describe "the quality of an item" do
      describe 'standard items' do
        it "decreases by 1 before sell by date" do
          items = [Item.new("foo", 2, 2)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 1
        end
        it "decreases by 2 after sell by date" do
          items = [Item.new("foo", 0, 4)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 2
        end
        it "never drops below 0" do
          items = [Item.new("foo", 2, 0)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 0
        end
      end
      
      describe 'Aged Brie' do
        it "increases in quality" do
          items = [Item.new("Aged Brie", 5, 5)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to be > 5
        end
        it "is never more than 50" do
          items = [Item.new("Aged Brie", 5, 50)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 50
        end
      end

      describe 'Conjured' do
        it "decreases by 2 before sell by date" do
          items = [Item.new("Conjured", 2, 10)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 8
        end
        it "decreases by 4 after sell by date" do
          items = [Item.new("Conjured", 0, 10)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 6
        end
      end

      describe 'Sulfuras, Hand of Ragnaros' do
        it "retains quality if the item is 'Sulfuras, Hand of Ragnaros'" do
          items = [Item.new("Sulfuras, Hand of Ragnaros", 5, 80)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 80
        end
      end
      
      describe 'backstage passes' do
        it "increases by 2 if there are between 10 and 6 days left, inclusive" do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 6, 5)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 7
        end
        it "increases by 3 if there are between 5 and 0 days left, inclusive" do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 4, 5)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 8
        end
        it "drops to 0 after the concert" do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 5)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 0
        end
        it "is never more than 50" do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 6, 50)]          
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 50
        end
      end
    end

    describe "the sell by date of an item" do
      describe 'standard items' do
        it "decreases by 1" do
          items = [Item.new("foo", 2, 1)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq 1
        end
      end
      describe 'Sulfuras, Hand of Ragnaros' do
        it "doesn't have to be sold by any date if the item is 'Sulfuras, Hand of Ragnaros'" do
          items = [Item.new("Sulfuras, Hand of Ragnaros", 5, 80)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq 5
        end
      end
    end
  end
end
