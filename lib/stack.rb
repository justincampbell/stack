require "stack/version"

class Stack
  class OutOfBoundsError < StandardError; end

  def initialize
  end

  def push(item)
    items << item
  end

  def peek(pos = nil)
    return items.fetch(pos) if pos

    items.last
  rescue IndexError
    raise OutOfBoundsError
  end

  def length
    items.length
  end

  private

  def items
    @items ||= []
  end
end
