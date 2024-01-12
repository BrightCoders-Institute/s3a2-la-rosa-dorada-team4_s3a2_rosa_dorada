require 'test/unit'
require_relative './../lib/item'
require_relative './../lib/gilded_rose'

class TestUntitled < Test::Unit::TestCase
  def test_normal_item
    items = [Item.new('foo', 1, 0)]
    GildedRose.new(items).update_quality
    assert_equal items[0].sell_in, 0
    assert_equal items[0].quality, 0
  end

  def test_normal_aged_brie
    items = [Item.new('Aged Brie', 1, 0)]
    GildedRose.new(items).update_quality
    assert_equal items[0].sell_in, 0
    assert_equal items[0].quality, 1
  end

  def test_normal_sulfuras
    items = [Item.new('Sulfuras, Hand of Ragnaros', 1, 80)]
    GildedRose.new(items).update_quality
    assert_equal items[0].sell_in, 1
    assert_equal items[0].quality, 80
  end

  def test_normal_backstage_passes
    items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 1, 0)]
    GildedRose.new(items).update_quality
    assert_equal items[0].sell_in, 0
    assert_equal items[0].quality, 0
  end

  def test_normal_conjured
    items = [Item.new('Conjured Mana Cake', 1, 2)]
    GildedRose.new(items).update_quality
    assert_equal items[0].sell_in, 0
    assert_equal items[0].quality, 0
  end
end
