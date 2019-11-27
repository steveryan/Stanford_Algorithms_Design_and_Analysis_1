qsarray = File.open("QuickSort.txt").readlines.map(&:chomp)
$array = qsarray.map {|item| item.to_i}
$count = 0

def choose_pivot_index(start_index, end_index)
  length = (end_index - start_index) + 1
  pivot_element = length.even? ? length/2 - 1 : length/2
  pivot_index = start_index + pivot_element
  a = [$array[start_index], $array[pivot_index], $array[end_index]].sort
  median = a[1]

  return start_index if median == $array[start_index]
  return pivot_index if median == $array[pivot_index]
  return end_index if median == $array[end_index]

end

def partition(start_index, end_index)
  $count += (end_index - start_index)
  if end_index - start_index == 1
    $array[start_index], $array[end_index] = $array[end_index], $array[start_index] if $array[end_index] < $array[start_index]
  else
    pivot_index = choose_pivot_index(start_index, end_index)
    pivot = $array[pivot_index]
    $array[start_index], $array[pivot_index] = $array[pivot_index], $array[start_index]

    i = start_index + 1
    for j in (start_index + 1..end_index) do
      if $array[j] < pivot
        $array[j], $array[i] = $array[i], $array[j]
        i += 1
      end
      j += 1
    end

    $array[i - 1], $array[start_index] = $array[start_index], $array[i - 1]
    partition(start_index, i - 2) if i-2 > start_index
    partition(i , end_index) if i < end_index
  end
end

partition(0, $array.length - 1)
puts $array.to_s
puts $count
