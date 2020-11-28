module Enumerable
  def my_each
    arr = to_a
    i = 0
    n_array = []
    while i < arr.length
      x = arr[i]
      n_array[i] = yield(x)
      i += 1
    end
    self
  end

  def my_each_with_index
    arr = to_a
    i = 0
    n_array = []
    while i < arr.length
      x = arr[i]
      n_array[i] = yield(x, i)
      i += 1
    end
    self
  end

  def my_select
    arr = self
    n_array = []
    arr.my_each { |x| n_array << x if yield x }
    n_array
  end

  def my_all?(arg = nil)
    arr = self
    y = false
    if block_given?
      arr.my_each { |x| return true if yield x }
    elsif !block_given? && arg.nil?
      return true
    else
      arr.my_each { |x| y = x == arg }
    end
    y
  end

  def my_any?(param = nil)
    if block_given?
      to_a.my_each { |item| return true if yield(item) }
      return false
    elsif param.nil?
      to_a.my_each { |item| return true if item }
    elsif !param.nil? && (param.is_a? Class)
      to_a.my_each { |item| return true if [item.class, item.class.superclass].include?(param) }
    elsif !param.nil? && param.class == Regexp
      to_a.my_each { |item| return true if param.match(item) }
    else
      to_a.my_each { |item| return true if item == param }
    end
    false
  end

  def my_none?(arg = nil)
    arr = self
    if block_given?
      arr.my_each { |x| return false if yield x }
    elsif !block_given? && arg.nil?
      arr.my_each { |x| return false if !x.nil? || x == true }
    else
      arr.my_each { |x| return true if x != arg }
    end
    true
  end

  def my_count(arg = nil)
    arr = self
    y = 0
    if block_given?
      arr.my_each { |x| y += 1 if yield x }
    elsif !block_given? && arg.nil? { y = arr.length }
    else
      y = arr.my_select { |x| x == arg }.length
    end
    y
  end

  def my_map(arg = nil)
    array = to_a
    index = 0
    n_array = []
    while index < array.length
      n_array[index] = arg.nil? ? yield(array[index]) : yield(arg[index])
      index += 1
    end
    n_array
  end

  def my_inject(arg1 = nil, arg2 = nil)
    if (!arg1.nil? && arg2.nil?) && (arg1.is_a?(Symbol) || arg1.is_a?(String))
      arg2 = arg1
      arg1 = nil
    end
    if !block_given? && !arg2.nil?
      my_each { |ele| arg1 = arg1.nil? ? ele : arg1.send(arg2, ele) }
    else
      my_each { |ele| arg1 = arg1.nil? ? ele : yield(arg1, ele) }
    end
    arg1
  end
end

def multiply_els(elements)
  elements.my_inject(:*)
end

puts '4.--------my_all--------'
puts (%w[ant bear cat].my_all? { |word| word.length >= 3 }) #=> true
puts (%w[ant bear cat].my_all? { |word| word.length >= 4 }) #=> false
puts %w[ant bear cat].my_all?(/t/) #=> false
puts [1, 2i, 3.14].my_all?(Numeric) #=> true
puts [].my_all? #=> true