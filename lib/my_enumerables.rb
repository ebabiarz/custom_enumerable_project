module Enumerable
  def my_each_with_index
    array = []
    self.each_index do |index|
      array << self[index] if yield(self[index], index) == nil
    end

    return array
  end

  def my_select
    array = []
    self.each do |element|
      array << element if yield(element)
    end

    return array
  end

  def my_all?
    if block_given?
      self.each do |element|
        return false if yield(element) == false
      end
      return true
    else
      return true
    end
  end

  def my_any?
    if block_given?
      self.each do |element|
        return true if yield(element)
      end
      return false
    else
      return true
    end
  end

  def my_none?
    if block_given?
      self.each do |element|
        return false if yield(element)
      end
      return true
    else
      self.each do |element|
        return true if element == nil || element == false
      end
      return false
    end
  end

  def my_count
    i = 0
    if block_given?
      self.each do |element|
        i += 1 if yield(element)
      end
    else
      self.each do |element|
        i += 1
      end
    end

    return i
  end

  def my_map
    array = []
    if block_given?
      self.each do |element|
        array << yield(element)
      end
    end

    return array
  end

  def my_inject(initial_value)
    final_value = 0

    if block_given?
      final_value += initial_value
      self.each do |element|
        final_value = yield(final_value, element)
      end
    end

    return final_value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    array = []
    self.each do |element|
      array << element if yield(element) == nil
    end

    return array
  end
end
