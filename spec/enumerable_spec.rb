require './lib/enumerable.rb'

RSpec.describe Enumerable do
  let(:result){ [] }
  describe "#my_each" do
    it "returns the object that it was invoked upon" do
      expect([1,2,3].my_each { |n| n}).to eql([1,2,3])
      # expect(array.my_each.to_a).to eq(array)
    end

    it "returns enumerator of the receiver" do
      array=[1,2,3]
      expect(array.my_each {|i| i }).to eql(array)
    end
  end
  describe "#my_each_with_index" do
    it "works with two arguments item and index" do
      [1,2,3].my_each_with_index { |item, index|
        result << item; result << index
      }
      expect(result).to eql([1,0,2,1,3,2])
    end
  end
  describe "#my_select"  do
    it "returns true if an item is even else false" do
      arr=[1,2,3,4,4]
      arr.my_select do |item|
        result << item.even?
      end
      expect(result).to eql([false,true, false, true, true])
    end
    it "returns an item(s) which is(are) greater than 2" do
      arr=[1,2,3,4,4]
      result=arr.my_select { |item| item > 2}
      expect(result).to eq([3,4,4])
    end
  end
  describe "#my_all?" do
    it "returns true if the length of all the words in the array are longer than 2" do
      str=["wordd", "any", "honey", "med"]
      result=str.my_all? {
        |w| w.length>=2
      }
      expect(result).to be true
    end
    it "returns false if the length of one of the words in the array are less than 2" do
      str=["wordd", "any", "honey", "med", " "]
      result=str.my_all? {
        |w| w.length>=2
      }
      expect(result).to be false
    end
  end
  describe "#my_any?" do
    it "returns true if any of the items is true" do 
      arr=[1,2,3,4,4]
      result=arr.my_any? do
        |i| i>2
      end
      expect(result).to be true
    end
    it "returns true if the length of any word in the array is longer than 2" do
      str=["wordd", "any", "honey", "med"]
      result=str.my_all? {
        |w| w.length>=2
      }
      expect(result).to be true
    end
  end
  describe "#my_none" do
    it "returns true if none of the items is true" do
      str=["wordd", "any", "honey", "med"]
      result = str.my_none? do
        |i| i.length<1
      end
      expect(result).to be true
    end
    it "returns false if any of the items is true" do
      str=["wordd", "any", "honey", "med"]
      result = str.my_none? do
        |i| i.length<4
      end
      expect(result).to be false
    end
  end
  describe "#my_count" do
    it "returns the number of even numbers in the given array" do
      nums = [1,2,3,4,5,6,7,8,9,10]
      result=nums.my_count(&:even?)
      expect(result).to eql(5)
    end
    it "returns the number of 2's" do
      nums = [1,2,6,2,1,6]
      result=nums.my_count(2)
      expect(result).to eql(2)
    end
  end
end