class LRUCache
   attr_reader :list, :size
   def initialize(size)
     @list = Array.new
     @size = size 
   end

   def count
     # returns number of elements currently in cache
     return list.count
   end

   def add(el)
     # adds element to cache according to LRU principle
    if !list.include?(el)
      if list.length == size
        list.shift
        list << el
      else
        list << el
      end 
    else
        list.delete(el)
        list << el      
    end
    
  
    
   end

   def show
     # shows the items in the cache, with the LRU item first
     list.to_s
   end

   private
   # helper methods go here!

 end
 
 
 
 