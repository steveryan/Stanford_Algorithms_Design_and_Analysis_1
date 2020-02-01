raw_rows = File.open("dijkstraData.txt").readlines.map(&:chomp)
raw_array = []
raw_rows.each_with_index do |row, index|
  raw_array[index] = row.split(/\t+/)
end

$graph = {}
$length = {}
$explored = [1]
$unexplored = *(2..200)

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
    else
      $length[row[0].to_i][vertex] = length
    end
  end
end

$PSP = {}
$SP = {}

(1..200).each do |i|
  $PSP[i] = 1000000
end

$PSP.delete(1)
$SP[1] = 0

def calculate_PSP(vertex)
  if $graph[vertex] != nil
    $graph[vertex].each do |node|
      if $unexplored.include?(node)
        psp = $SP[vertex] + $length[vertex][node]
        $PSP[node] = psp if psp < $PSP[node]
      end
    end
  end
end
$last_node_explored = 1

while !$unexplored.empty? do
  calculate_PSP($last_node_explored)
  $last_node_explored = $PSP.sort_by {|k, v| v}.first[0]
  $unexplored.delete($last_node_explored)
  $explored << $last_node_explored
  $SP[$last_node_explored] = $PSP[$last_node_explored]
  $PSP.delete($last_node_explored)
end
puts $SP
puts "SP to 7 is #{$SP[7]}"
puts "SP to 37 is #{$SP[37]}"
puts "SP to 59 is #{$SP[59]}"
puts "SP to 82 is #{$SP[82]}"
puts "SP to 99 is #{$SP[99]}"
puts "SP to 115 is #{$SP[115]}"
puts "SP to 133 is #{$SP[133]}"
puts "SP to 165 is #{$SP[165]}"
puts "SP to 188 is #{$SP[188]}"
puts "SP to 197 is #{$SP[197]}"
