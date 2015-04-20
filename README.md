##Histogram Assignment

Implement a histogram where values are bucketed into ranges of 100. E.g. all values in the range 1100-1200 belong in one bucket. For efficiency, store only the count of values in each bucket. Don't store the individual values.

Compute (approximately) the specified percentile of all values in this histogram.

@param percent The percentile to compute. E.g. 50 --> 50th
percentile, 90 --> 90th percentile, 99.9 --> 99.9th percentile.

@return An approximation of the specified percentile.

##My Approach
Create a Ruby Histogram class that has two public methods:

add_value(value) & percentile?(value)

The first method will take in a value and determine the range or the interval that the number belongs to.
Here is some sample code for determining the interval:

low_end = value / 100 * 100
high_end = ((value + 99) / 100 * 100) -1
[low_end, high_end]

This will be stored as a key and incremented each time a number is added to this bucket.

When the user calls percentile?(value) he or she will pass in a value and the function will return a percentage of values that are including and below this interval. 
