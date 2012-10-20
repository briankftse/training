class Node
  attr_accessor :value, :next
  def initialize(val)
    @value = val
    @next = nil
  end
end

class LinkedList
  attr_accessor :root

  def initialize
    @root = nil
  end

  def empty?
    @root.nil?
  end

  def add(node)
    if empty?
      @root = node
    else
      node.next = @root
      @root = node
    end
  end

  def addToEnd(add_node)
    if empty?
      self.add(add_node)
      return
    else
      node = @root
      while !node.next.nil?
        node = node.next
      end

      node.next = add_node
    end
  end

  def remove
    @root = @root.next
  end

  def count
    return 0 if empty?

    node = @root
    count = 1

    while node.next != nil
      node = node.next
      count += 1
    end
  end

  # 2.1
  def removeDuplicates
    hsh = {}
    previous = @root
    current = @root.next
    while !current.nil?
      if hsh[current.value]
        previous.next = previous.next.next
      else
        hsh[current.value] = true
      end
      previous = previous.next
      current = current.next
    end
  end

  # 2.1a
  def removeDuplicates2
    previous = @root
    current = @root.next

    while !current.nil?
      runner = @root
      while runner != current

        if runner.value == current.value
          previous.next = previous.next.next
        end

        # let the runner be ahead by 1
        if previous != @root
          previous = previous.next
        end

        runner = runner.next
      end

      previous = @root
      current = current.next
    end
  end

  # 2.2
  def nthToLast(n)
    offset = @root
    Raise "can't be negative" if n < 0
    (0..n).each do |i|
      offset = offset.next
      Raise "offset too large" if offset.nil?
    end

    current = @root
    while !offset.next.nil?
      offset = offset.next
      current = current.next
    end

    current
  end

  # 2.3 right
  def deleteMiddle(node)
    if node.nil? || node.next.nil?
      return false
    end

    node.value = node.next.value
    node.next = node.next.next

    return true
  end

  # 2.3 wrong
  def deleteMiddle2(node)
    current = @root.next
    previous = @root

    while !current.next.nil?
      if current == node
        previous.next = previous.next.next
      end

      current = current.next
      previous = previous.next
    end
  end

  # 2.4
  def addLists(list1,list2)
    num1 = numFromList(list1)
    num2 = numFromList(list2)
    total = num1 + num2

    return listFromNum(total)
  end

  # 2.4
  def numFromList(list)
    current = list.root
    num = nil
    while !current.next.nil?
      if num.nil?
        num = current.val
      else
        num = (num * 10) + current.val
      end
    end

    num
  end

  # 2.4
  def listFromNum(num)
    list = LinkedList.new

    while num != 0
      list.add(num%10)
      num = num/10
    end

    list
  end
end
