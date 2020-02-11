list = File.open("Median.txt").readlines.map(&:chomp)

list.map!(&:to_i)
testarr = [4,4,6,3,8,1]

$low_heap = []
$high_heap = []

def add_to_high_heap(value)
  $high_heap.push(value)
  inserted_at = $high_heap.length - 1
  while $high_heap[inserted_at] < $high_heap[(inserted_at-1)/2] && inserted_at > 0
    $high_heap[inserted_at], $high_heap[(inserted_at-1)/2] = $high_heap[(inserted_at-1)/2], $high_heap[inserted_at]
    inserted_at = (inserted_at-1)/2
  end
end

def add_to_low_heap(value)
  $low_heap.push(value)
  inserted_at = $low_heap.length - 1
  while $low_heap[inserted_at] > $low_heap[(inserted_at-1)/2] && inserted_at > 0
    $low_heap[inserted_at], $low_heap[(inserted_at-1)/2] = $low_heap[(inserted_at-1)/2], $low_heap[inserted_at]
    inserted_at = (inserted_at-1)/2
  end
end

def get_min_of_high_heap
  minimum = $high_heap[0]
  last_value = $high_heap.pop
  $high_heap[0] = last_value
  value_to_track = 0
  while $high_heap[(2*value_to_track)+1] && ($high_heap[value_to_track] > $high_heap[(2*value_to_track)+1] || ($high_heap[(2*value_to_track)+2] && $high_heap[value_to_track] > $high_heap[(2*value_to_track)+2]))
    if !$high_heap[(2*value_to_track)+2] || ($high_heap[(2*value_to_track)+1] < $high_heap[(2*value_to_track)+2])
      $high_heap[value_to_track], $high_heap[(2*value_to_track)+1] = $high_heap[(2*value_to_track)+1], $high_heap[value_to_track]
      value_to_track = (2*value_to_track)+1
    else
      $high_heap[value_to_track], $high_heap[(2*value_to_track)+2] = $high_heap[(2*value_to_track)+2], $high_heap[value_to_track]
      value_to_track = (2*value_to_track)+2
    end
  end
  return minimum
end
# list.each_with_index do |value, index|
#
# end

testarr.each do |value|
  add_to_high_heap(value)
  add_to_low_heap(value)
end

p $high_heap
p $low_heap
minimum = get_min_of_high_heap
p minimum
minimum = get_min_of_high_heap
p minimum
minimum = get_min_of_high_heap
p minimum
minimum = get_min_of_high_heap
p minimum
minimum = get_min_of_high_heap
p minimum
minimum = get_min_of_high_heap
p minimum
