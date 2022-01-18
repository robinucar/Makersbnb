require 'property'
require 'pg'

describe 'property' do
    describe '.add' do
        it 'should add property' do
            property = Property.add(description: "property_1", price: 5)
            expect(property.description).to eq "property_1"
            expect(property.price).to eq 5
        end

        it 'should add multiple properties' do
            property = Property.add(description: "property_1", price: 5)

            Property.add(description: "property_2", price: 5)

            properties = Property.all

            expect(properties.length).to eq 2 
            expect(properties.first).to be_a Property
            expect(properties.first.id).to eq property.id
            expect(properties.first.description).to eq 'property_1'
            expect(properties.last.description).to eq 'property_2'
        end
    

        # it 'should have a price' do
        # end
    end
end