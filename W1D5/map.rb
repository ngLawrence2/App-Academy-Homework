class Map
	
	def initialize
		@map = Array.new {Array.new(2)}
	end 
	def show
		@map.each do |i|
			p i
		end 
	end 
	
	
	
	def get(key)
		@map.each do |k|
			if k.first == key 
				return k.last
			end 
		end
		nil
	end 
	
	
	def set(key,val)
		if get(key).nil?
			@map << [key,val]
		else
			@map.each_index do |k|
				if @map[k].first == key
                    @map[k] = [key,val]
				end 
			end 
		end 
	end 
	
	def delete(key)
		@map.each_index do |k|
			if @map[k].first == key 
				@map.delete_at(k)
			end 
		end 
	end 
end 