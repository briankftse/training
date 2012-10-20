class Stack
  def initialize(size)
    @arr = Array.new(size)
    @head = 0
  end

  def push(val)
    @head += 1
    @arr[@head] = val

    return val
  end

  def pop
    val = @arr[@head]
    @head -= 1

    return val
  end
end

class Queue
  def initialize(size)
    @arr = Array.new(size)
    @head = 0
    @tail = 0
  end

  def empty?
    @head == @tail
  end

  def enqueue(val)
    if empty?
      @head = 0
      @tail = 0
    end

    @arr[@tail] = val
    @tail += 1
  end

  def dequeue
    val = @arr[@head]
    @head += 1

    return val
  end
end

# 3.1
# Divide the array into 3 even parts

