raw_rows = File.open("dijkstraData.txt").readlines.map(&:chomp)
raw_array = []
raw_rows.each_with_index do |row, index|
  raw_array[index] = row.split(/\t+/)
end

$graph = {}
$length = {}

raw_array.each do |row|
  for i in 1...row.length
    vertex = row[i].split(',')[0].to_i
    length = row[i].split(',')[1].to_i
    if $graph[row[0].to_i]
      $graph[row[0].to_i] << vertex
    else
      $graph[row[0].to_i] = [vertex]
    end
    if $length[row[0].to_i]
    else
      $length[row[0].to_i] = {}
    end
    if $length[row[0].to_i][vertex]
      $length[row[0].to_i][vertex] << length
    else
      $length[row[0].to_i][vertex] = [length]
    end
  end
end

puts raw_array[0].to_s
puts raw_array[169].to_s

puts $length[1][170]
