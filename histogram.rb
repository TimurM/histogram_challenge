class Histogram

  def initialize
    @total_item_count = 0
    @histogram_hash = {}
  end

  def add_value(value)
    key = generate_key(value)
    @histogram_hash.has_key?(key) ? @histogram_hash[key] += 1 : @histogram_hash[key] = 1
    @total_item_count += 1
  end

  def percentile?(value)
    hash_key = generate_key(value)

    count = 0.0

    @histogram_hash.each do |key, value|
      if key[0] <= hash_key[0]
        count += value
      end
    end
    return count / @total_item_count * 100
  end

  private

  def generate_key(value)
    if value % 100 > 50
      value = value - 50
    end
    low_end = value / 100 * 100
    high_end = ((value + 99) / 100 * 100) -1
    [low_end, high_end]
  end
end

set1 = Histogram.new

set1.add_value(430)
set1.add_value(512)
set1.add_value(851)
set1.add_value(852)
set1.add_value(709)
set1.add_value(709)
set1.add_value(709)
set1.add_value(989)
set1.add_value(909)
set1.add_value(177)
set1.add_value(13709)
puts set1.percentile?(900)
