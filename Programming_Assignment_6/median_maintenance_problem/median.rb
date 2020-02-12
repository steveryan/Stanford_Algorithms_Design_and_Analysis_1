list = File.open("Median.txt").readlines.map(&:chomp)

list.map!(&:to_i)
testarr = [4,7,9,4,6,3,8,1]

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
  if $high_heap.length == 1
    $high_heap.pop
    return minimum
  end
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

def get_max_of_low_heap
  maximum = $low_heap[0]
  if $low_heap.length == 1
    $low_heap.pop
    return maximum
  end
  last_value = $low_heap.pop
  $low_heap[0] = last_value
  value_to_track = 0
  while $low_heap[(2*value_to_track)+1] && ($low_heap[value_to_track] < $low_heap[(2*value_to_track)+1] || ($low_heap[(2*value_to_track)+2] && $low_heap[value_to_track] < $low_heap[(2*value_to_track)+2]))
    if !$low_heap[(2*value_to_track)+2] || ($low_heap[(2*value_to_track)+1] > $low_heap[(2*value_to_track)+2])
      $low_heap[value_to_track], $low_heap[(2*value_to_track)+1] = $low_heap[(2*value_to_track)+1], $low_heap[value_to_track]
      value_to_track = (2*value_to_track)+1
    else
      $low_heap[value_to_track], $low_heap[(2*value_to_track)+2] = $low_heap[(2*value_to_track)+2], $low_heap[value_to_track]
      value_to_track = (2*value_to_track)+2
    end
  end
  return maximum
end

$medians=[]

list.each do |value|
  if $low_heap.length == 0 && $high_heap.length == 0
    add_to_low_heap(value)
  elsif value > $low_heap[0]
    add_to_high_heap(value)
  else
    add_to_low_heap(value)
  end
  if $low_heap.length - $high_heap.length > 1
    value_to_switch = get_max_of_low_heap
    add_to_high_heap(value_to_switch)
  elsif $high_heap.length - $low_heap.length > 1
    value_to_switch = get_min_of_high_heap
    add_to_low_heap(value_to_switch)
  end
  if $low_heap.length - $high_heap.length >= 0
    $medians.push($low_heap[0])
  else
    $medians.push($high_heap[0])
  end
end

answer = ($medians.sum)%10000
p answer
