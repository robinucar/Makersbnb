require 'property'

describe 'property' do
    describe '.add' do
        it 'should add property' do
            property = Property.add(property: "property_1")
            expect(property).to eq "property_1"
        end
    end
end