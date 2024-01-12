# frozen_string_literal: true

# GildedRose class to update items
class GildedRose
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      case item.name
      when check_item_name(item.name, 'Aged Brie') then age_brie_case(item)
      when check_item_name(item.name, 'Backstage passes') then backstage_passes_case(item)
      when check_item_name(item.name, 'Sulfuras') then next
      when check_item_name(item.name, 'Conjured') then conjured_case(item)
      else default_case(item)
      end
    end
  end

  def default_case(item)
    item.quality -= 1 if item.quality.positive?
    item.sell_in -= 1
    item.quality -= 1 if item.sell_in.negative? && item.quality.positive?
  end

  def age_brie_case(item)
    item.quality = [item.quality + 1, 50].min
    item.sell_in -= 1
    item.quality += 1 if item.sell_in.negative?
  end

  def backstage_passes_case(item)
    item.quality = [item.quality + 1, 50].min
    item.quality += 1 if item.sell_in < 11 && item.quality < 50
    item.quality += 1 if item.sell_in < 6 && item.quality < 50
    item.sell_in -= 1
    item.quality -= item.quality
  end

  def conjured_case(item)
    item.quality -= 2 if item.quality.positive?
    item.sell_in -= 1
    item.quality -= 2 if item.sell_in.negative? && item.quality.positive?
  end

  def check_item_name(name, item_name)
    return name if name.include?(item_name)

    'default'
  end
end
