$mincut = 100000

def random_contraction
  rand1 = rand(0..$array.length - 1)
  rand2 = $array[rand1][rand(1..$array[rand1].length - 1)].to_i

  $array.each_with_index do |row,index|
    if row[0].to_i == rand2
      $v2index = index
    end
  end

  vertex1 = $array[rand1]
  vertex2 = $array[$v2index]

  vertex1.delete(vertex2.first)

  old_node = vertex2.shift
  new_node = vertex1[0]

  vertex1.delete(vertex2[0])
  vertex2.delete(vertex1[0])

  $array[rand1] = vertex1 + vertex2
  $array.slice!($v2index)

  $array.each do |row|
    row.map! { |x| x == old_node ? new_node : x }
  end
end

10000.times do
  kmcarray = File.open("test1.txt").readlines.map(&:chomp)
  $array = []
  kmcarray.each_with_index do |row, index|
    $array[index] = row.split(/\W+/)
  end

  while $array.length > 2
    random_contraction
  end
  # we subtract 1 from the row because the first entry in the row is the node itself
  $mincut = $array[0].count - 1 if $array[0].count < $mincut
end

puts $mincut
