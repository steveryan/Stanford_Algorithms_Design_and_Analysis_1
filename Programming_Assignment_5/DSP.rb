raw_rows = File.open("dijkstraData.txt").readlines.map(&:chomp)
raw_array = []
raw_rows.each_with_index do |row, index|
  raw_array[index] = row.split(/\t+/)
end

$graph = {}

raw_array.each do |row|
  if $graph[row[0].to_i]
    $graph[row[0].to_i] << row[1].to_i
  else
    $graph[row[0].to_i] = [row[1].to_i]
  end
  if $rev_graph[row[1].to_i]
    $rev_graph[row[1].to_i] << row[0].to_i
  else
    $rev_graph[row[1].to_i] = [row[0].to_i]
  end
end

puts raw_array[0].to_s
