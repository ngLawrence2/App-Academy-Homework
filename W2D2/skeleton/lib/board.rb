class Board
  attr_accessor :cups

  def initialize(name1, name2)
	@player1=name1
	@player2=name2
	@cups  = Array.new(14)
	place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
	idx = 0 
	while idx < @cups.length 
		@cups[idx] = [:stone, :stone, :stone, :stone]
	idx = idx + 1 
	end 
	@cups[6].clear
	@cups[13].clear
  end

  def valid_move?(start_pos)
	if !start_pos.between?(0,13)
		raise 'Invalid starting cup'
	end 
	if @cups[start_pos].empty?
		raise 'Starting cup is empty'
	end 
  end

  def make_move(start_pos, current_player_name)
	move = @cups[start_pos]
 
	idx = start_pos 
	until move.empty?
	idx = idx + 1 
		if idx >13 
			idx = 0 
		end 
		if idx ==6 
			@cups[6] << move.shift if current_player_name == @player1
		elsif idx==13 
			@cups[13] << move.shift if current_player_name == @player2
		else
			@cups[idx] << move.shift
		end 
		
	end 
	render
	next_turn(idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
	
		if ending_cup_idx == 6 || ending_cup_idx == 13 
			return :prompt 
		end 
		
		if @cups[ending_cup_idx].length == 1
			return :switch 
		end 
		
		
		return ending_cup_idx
	
		
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
	return true if @cups[0...6].all? { |cup| cup.empty? } 
	return true  if @cups[7...13].all? { |cup| cup.empty? }
	return false 
  end

  def winner
	return :draw if @cups[6].length == @cups[13].length 
	return @player1 if @cups[6].length > @cups[13].length 
	return @player2  
  end
end
