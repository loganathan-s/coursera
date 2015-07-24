class WeightedQucikUnion

  # Initialize Component Array
  #
  def initialize(component_size)
    @component_array = (0..component_size.to_i-1).to_a
    @node_depth = []
    # all elements are associated to itself by default (depth of each node in tree)
    component_size.to_i.times {|i| @node_depth[i] = 1}
  end

  # Connect the element if it is not connected already
  #
  def union(p, q)
    p_root = root(p)
    q_root = root(q)
    unless(root(p).eql? root(q))
      if(@node_depth[p_root] < @node_depth[q_root])
        @component_array[p_root] = q_root
        @node_depth[q_root] += @node_depth[p_root]
      else
        @component_array[q_root] = p_root
        @node_depth[p_root] += @node_depth[q_root]
      end
    end
  end

  def connected(p, q)
    (root(p) == root(q)) ? true : false
  end

  def components
    return @component_array
  end

  def root(element_index)
    # Loop until index == component value, by default all the elements in array are linked to itself, if its vary then it is connected to some other element in the array
    #
    while element_index != @component_array[element_index]
      element_index = @component_array[element_index]
    end
    return element_index
  end
end

w_q_f = WeightedQucikUnion.new(10)
w_q_f.union(5, 8)
w_q_f.union(5, 9)
w_q_f.union(0, 4)
w_q_f.union(3, 1)
w_q_f.union(9, 7)
w_q_f.union(8, 6)
w_q_f.union(4, 1)
w_q_f.union(7, 3)
w_q_f.union(2, 3)
w_q_f.components
