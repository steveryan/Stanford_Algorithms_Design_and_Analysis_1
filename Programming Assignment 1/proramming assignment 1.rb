array = File.open("IntegerArray.txt").readlines.map(&:chomp)
intarray = array.map {|item| item.to_i}
$inversions = 0
def countinv(input)
  if input.length > 1
    left, right = input.each_slice((input.size / 2.0).round).to_a
    sortedleft = countinv(left)
    sortedright = countinv(right)
    mergeandcountsplitinv(sortedleft, sortedright)
  else
    input
  end
end

def mergeandcountsplitinv(sortedleft, sortedright)
  outputlength = sortedleft.length + sortedright.length
  output = []
  i = 0
  j = 0
  (0..outputlength - 1).each do |index|
    if i > (sortedleft.length - 1)
      output[index] = sortedright[j]
      j += 1
    elsif j > (sortedright.length - 1)
      output[index] = sortedleft[i]
      i += 1
    elsif sortedleft[i] < sortedright[j]
      output[index] = sortedleft[i]
      i += 1
    elsif sortedright[j] < sortedleft[i]
      output[index] = sortedright[j]
      j += 1
      $inversions = $inversions + (sortedleft.length - i)
    end
  end
  output
end

countinv(intarray)
puts $inversions
