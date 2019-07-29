module Enumerable
  def my_each
    for item in self do
      yield(item)
    end
  end

  def my_each_with_index
    i=0
    for item in self do
      yield(item, i)
      i+=1
    end
  end

  def my_select
    arr=[]
      self.my_each do
        |item| arr << item if yield(item)
      end
    arr
  end

  def my_all?
    check=false
      self.my_each do |item|
        check = yield(item)
        break if not check
      end
    check
  end

  def my_any?
    check = false
      self.my_each do |item|
        check=yield(item)
        break if check
      end 
      check
  end

  def my_none?
    check = false
    self.my_each do |item|
      check = !yield(item)
      break if not check  
    end 
    check
  end

  def my_count(arg=nil)
    arr=[]
    if arg != nil
      self.my_each do |i|
        arr << i if arg == i
      end
    elsif block_given? == false
      self.length
    else
      self.my_each do |i|
        arr << i if yield(i)
      end
    end
    arr.length
  end

  def my_map(&proc)
    arr=[]
    return self unless proc or block_given?
    self.my_each do |item|   
      if block_given?
        arr << yield(item)
      else
        arr << proc.call(item)
      end
    end
    arr
  end

  def my_inject(*arg)
    ac=self[0]
    for item in self[1..self.length] do
      ac=yield(ac,item)
    end
    ac
  end
end
arr=[2,3,4]
result=arr.my_inject do
  |i, e| i*e
end
add=arr.my_inject do
  |i, e| i+e
end

puts result

puts add