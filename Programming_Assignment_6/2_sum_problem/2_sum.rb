raw_rows = File.open("algo1-programming_prob-2sum.txt").readlines.map(&:chomp)
$ints = {}
raw_rows.each do |integer|
  $ints[integer.to_i] = true
end

$distinct_pair_count = 0

for i in -10000..10000
  t = i
  $ints.each_key do |key|
    target = t - key
    if $ints[target] && key != target
      $distinct_pair_count += 1
      break
    end
  end
end

p $distinct_pair_count
