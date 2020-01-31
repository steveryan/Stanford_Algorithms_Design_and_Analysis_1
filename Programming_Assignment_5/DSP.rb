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
      $length[row[0].to_i][vertex] << length
    else
      $length[row[0].to_i][vertex] = [length]
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
  $graph[vertex].each do |node|
    if $unexplored.includes(node)
      

    end
  end
end
