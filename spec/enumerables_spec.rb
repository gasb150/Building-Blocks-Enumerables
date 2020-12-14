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
    it "select elemets of the array" do
      expect(array.my_select { |friend| friend != 'Brian' }).to eql(%w[Sharon Leo Leila Arun])
    end
  end
end