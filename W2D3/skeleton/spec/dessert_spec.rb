require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:cake) { Dessert.new("cake", 10, chef) }

  describe "#initialize" do
    it "sets a type" do 
      expect(cake.type).to eq('cake')
    end 
  
    it "sets a quantity" do 
      expect(cake.quantity).to be > 0
    end
    
    it "starts ingredients as an empty array" do 
      expect(cake.ingredients).to be_empty
    end 


    it "raises an argument error when given a non-integer quantity" do 
        expect { Dessert.new('bread','a',chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    before(:each) do 
      cake.add_ingredient('flour')
      cake.add_ingredient('sugar')
    end
    it "adds an ingredient to the ingredients array" do 
        expect(cake.ingredients.length).to eq(2) 
    end 
  end

  describe "#mix!" do
    before(:each) do 
      
      cake.add_ingredient('flour')
      cake.add_ingredient('sugar')
      cake.add_ingredient('eggs')
      cake.add_ingredient('baking powder')
      cake.add_ingredient('butter')
      cake.add_ingredient('flour')
      cake.add_ingredient('sugar')
    
      cake.mix! 
    end
    it "shuffles the ingredient array" do 
      array = cake.ingredients.sort
      expect(cake.ingredients.length).to eq(7)
      expect(cake.ingredients.sort).to eq(array)
    end
  end

  describe "#eat" do
    before(:each) do 
      cake.eat(3)
    end 
    it "subtracts an amount from the quantity" do 
      expect(cake.quantity).to eq(7)
    end 
    
    it "raises an error if the amount is greater than the quantity" do
      expect{ cake.eat(11) }.to raise_error("not enough left!")
    end 
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
        allow(chef).to receive(:titleize).and_return("Chef Chef the Great Baker")
    end 
  
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"  do 
        expect(chef).to receive(:bake).with(cake)
        cake.make_more
    end 
  end
end
