require './enumerables'

describe Enumerable do
	let(:array) {%w[Sharon Leo Leila Brian Arun]}

  	context 'my_each' do
  	it "move into every item of array" do
    	expect(array.my_each { |friend| friend }).to eql(array)
    end
   end

	context 'my_each_with_index' do
		it "move into every item of array and match with index" do
  		expect(array.my_each_with_index { |friend, i| i }).to eql(array.each_with_index { |friend, i| i })
    end
	end

	context 'my_select' do
    it "select elements of the array" do
      expect(array.my_select { |friend| friend != 'Brian' }).to eql(%w[Sharon Leo Leila Arun])
    end
  end

	context 'my_all' do
  	it 'compare if all elements are TRUE' do
    	expect(array.my_all? { |word| word.length >= 3 }).to eql(true)
		end

		it 'compare if all elements are FALSE' do
    	expect(array.my_all? { |word| word.length >= 4 }).to eql(false)
		end

		it "compare if all elements has the letter 'a'" do
    	expect(array.my_all?(/a/)).to eql(false)
		end

		it "compare if all elements has a numeric value" do
    	expect([1, 2i, 3.14].my_all?(Numeric)).to eql(true)
		end

		it "return true if the array is empty" do
    	expect([].my_all?).to eql(true)
		end
	end

	context 'my_any' do
		it 'compare if any element are TRUE' do
    	expect(array.my_any? { |word| word.length >= 10 }).to eql(false)
		end

		it 'compare if any element are FALSE' do
    	expect(array.my_any? { |word| word.length >= 4 }).to eql(true)
		end

		it "compare if any element has the letter 'z'" do
    	expect(array.my_any?(/z/)).to eql(false)
		end

		it "compare if any element has a numeric value" do
    	expect([1, 2i, 3.14, 'b', 'nice'].my_any?(Integer)).to eql(true)
		end

		it "return true if the any there's any element inside the array, otherwise returns false" do
    	expect([].my_any?).to eql(false)
		end
	end

	context 'my_none' do
		it 'compare if none element return TRUE' do
    	expect(array.my_none? { |word| word.length >= 10 }).to eql(true)
		end

		it 'compare if none element return FALSE' do
    	expect(array.my_none? { |word| word.length >= 3 }).to eql(false)
		end

		it "compare if none element has the letter 'a'" do
    	expect(array.my_none?(/a/)).to eql(false)
		end

		it "compare if none element is a numeric value" do
     	expect(array.my_none?(Integer)).to eql(true)
		end

		it "return true if there's no element inside the array" do
			 expect([nil, false, true].my_none?).to eql(false)
			 expect([nil, false].my_none?).to eql(true)
			 expect([nil].my_none?).to eql(true)
			 expect([true].my_none?).to eql(false)
		end
	end

	context 'my_count' do
		it 'returns the count of the arguments given inside the array' do
			expect(array.my_count).to eql(5)
		end

		it 'returns the count of the arguments with same value given inside the array' do
			expect(array.my_count("Leo")).to eql(1)
		end

		it 'returns the count of the arguments with same value given inside the array' do
			expect([1, 3.14, 77].my_count { |x| (x % 2).zero? }).to eql(0)
		end
	end

end