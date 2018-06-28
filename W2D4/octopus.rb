def sluggish(arr)
  stopSwap = 1
  until stopSwap==0
    stopSwap=0
    arr[0...-1].each_index do |idx|
      swap = arr[idx].length<=>arr[idx+1].length
      if swap==1
        arr[idx],arr[idx+1] = arr[idx+1],arr[idx]
        stopSwap=stopSwap+1
      end
    end
  end
  arr.last
end

def dominant(arr)
  mergeSort(arr).last
end

def mergeSort(arr)
  return arr if arr.length<=1
  mid = arr.length/2
  left = mergeSort(arr.take(mid))
  right=mergeSort(arr.drop(mid))
  merge(left,right)
end

def merge(left,right)
  result= []
  until left.empty? || right.empty?
    left_var = left.first
    right_var=right.first
    if left_var.length < right_var.length
      result << left.shift
    else
      result << right.shift
    end
  end
  result + left + right
end


def clever(arr)
  largest = arr.first
  arr[1..-1].each do |el|
    largest = el if el.length > largest.length
  end
  largest
end


def slow_dance(dir,array)
  array.each_with_index do |el,idx|
    return idx if el==dir
  end
end

def fast_dance(dir,hash)
  hash[dir]
end
