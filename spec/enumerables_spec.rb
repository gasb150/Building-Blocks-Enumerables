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
     expect(%w[Sharon Leo Leila Brian Arun].my_each_with_index { |friend, index| puts friend if index.even? }).to eql(%w[Sharon Leila Arun])
    end
 end
end