class QucikFind

  # Initialize Component Array
  #
  def initialize(component_size)
    @component_array = (0..component_size.to_i-1).to_a
  end

  # Connect the element if it is not connected already
  #
  def union(p, q)
  current_p_root = @component_array[p]
    @component_array.each_with_index do |component, index|
      if component == current_p_root
        @component_array[index] = @component_array[q]
      end
    end
  end

  def connected(p, q)
    (@component_array[p] == @component_array[q]) ? true : false
  end

  def components
    return @component_array
  end
end

q_f = QucikFind.new(10)
q_f.union(3, 0)
q_f.union(5, 4)
q_f.union(9, 2)
q_f.union(7, 0)
q_f.union(4, 6)
q_f.union(2, 0)
q_f.components
q_f.connected(0,4)
