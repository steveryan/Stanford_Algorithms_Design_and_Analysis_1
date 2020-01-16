def dfs_loop(graph)
  $leader = {}
  $explored = {}
  $finishing_times.each do |vertex|
    dfs(vertex, graph, vertex) unless $explored[vertex]
  end

end

def rev_dfs_loop(graph)
  $leader = {}
  $explored = {}
  $finishing_times = []
  graph.each do |vertex, nodes|
    dfs(vertex, graph) unless $explored[vertex]
  end
  $finishing_times = $finishing_times.reverse
end

def dfs(vertex, graph, leader = 0)
  $explored[vertex] = 'true'
  if graph[vertex]
    graph[vertex].each do |node|
      dfs(node, graph, leader) unless $explored[node]
    end
  end
  $leader[leader] ? $leader[leader] << vertex : $leader[leader] = [vertex]
  $finishing_times << vertex if leader.zero?
end

raw_rows = File.open("SCC.txt").readlines.map(&:chomp)
raw_array = []
raw_rows.each_with_index do |row, index|
  raw_array[index] = row.split(/\W+/)
end

$graph = {}
$rev_graph = {}

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

puts 'Graph and Reverse Graph succesfully defined'
rev_dfs_loop($rev_graph)
dfs_loop($graph)
sccs = $leader.sort_by {|key,value| -value.length}.to_h
puts sccs[sccs.keys[0]].count
puts sccs[sccs.keys[1]].count
puts sccs[sccs.keys[2]].count
puts sccs[sccs.keys[3]].count
puts sccs[sccs.keys[4]].count
