# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  sum = 0
  arr.each { |a| sum+=a}
  return sum 
end

def max_2_sum arr
  return 0 if arr.empty?
  return arr.first if arr.length == 1
  x = arr.sort.reverse
    return x[0] + x[1]
end

def sum_to_n? arr, n
  return false if arr.empty? || arr.length ==1
  return arr.permutation(2).any? { |a, b| a + b == n }
end

# Part 2

def hello(name)
  return "Hello, " + name.to_s
end

def starts_with_consonant? s
  if s.empty?
    return false
  end
  x = ['B','C','D','F','G','H','J','K','L','M','N','P','Q','R','S','T','V','X','Y','Z','b','c','d','f','g','h','j','k','l','m','n','p','q','r','s','t','v','w','y','z']
  return x.include?(s[0]) 
end

def binary_multiple_of_4? s
  return true if s == "0"
  if s =~ /^[0-1]{1,}$/
    if s =~ /^(([10]+)00)$/
      return true
    end
    return false
  end
  return false
end

# Part 3

class BookInStock
# YOUR CODE HERE
  def initialize(isbn, price)
    @book_isbn = isbn
    @book_price = price
    if isbn.empty? || price<= 0
      raise ArgumentError
    end
  end

  def isbn()
    @book_isbn
  end

  def price()
    @book_price
  end

  def isbn=(isbn)
    @book_isbn = isbn
  end
  def price=(price)
    @book_price = price
  end

  def price_as_string()
    "$" + '%.2f' % @book_price
  end
end
