# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  arr.reduce(0) {|last, n| last + n }
end

def max_2_sum arr
  arr.sort.reverse.take(2).reduce(0) {|last, n| last + n }
end

def sum_to_n? arr, n
  if arr.length < 2
    return false
  end
  
  sorted = arr.sort
  l = 0
  r = arr.length - 1
  
  loop do
    break if l >= r
    if sorted[l] + sorted[r] == n
      return true
    elsif sorted[l] + sorted[r] < n
      l += 1
    else
      r -= 1
    end
  end
  false
end

#1) Sort the array in ascending order.
#2) Initialize two index variables to find the candidate 
#   elements in the sorted array.
#       (a) Initialize first to the leftmost index: l = 0
#       (b) Initialize second  the rightmost index:  r = ar_size-1
#3) Loop while l < r.
#       (a) If (A[l] + A[r] == sum)  then return 1
#       (b) Else if( A[l] + A[r] <  sum )  then l++
#       (c) Else r--    
#4) No candidates in whole array - return 0

# Part 2

def hello(name)
  "Hello, " + name
end

def starts_with_consonant? s
  if s.length == 0 then return false end
    
  "bcdfghjklmnpqrstvwxyz".include? s[0].downcase
end

def binary_multiple_of_4? s
  #true if:
  #s is zero
  #          s doesn't contain non binary chars
  #                                   s is at least three chars long
  #                                                     s doesn't contain the 1 or 2 bits
  if s != "0" && (nil == (/^[01]+$/ =~ s) || s.length < 3 || s.reverse[0,2] != "00")
    return false 
  end
  
  true
end

# Part 3

class BookInStock
  
  def initialize(isbn, price)
    self.isbn = isbn
    self.price = price
  end
  
  def isbn
    @ISBN
  end
  
  def isbn=(new_ISBN)
    if new_ISBN.length == 0
      raise ArgumentError, 'ISBN is not valid'
    end
    
    @ISBN = new_ISBN
  end
  
  def price
    @price
  end
  
  def price=(new_price)
    if new_price <= 0
      raise ArgumentError, 'Price must be greater than 0'
    end  
    @price = new_price
  end
  
  def price_as_string
    "$%.2f" % @price
  end
end
