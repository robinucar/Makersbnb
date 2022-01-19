require 'property'
require 'pg'
require 'database_helpers'

describe Property do
    describe '.add' do
        it 'should add a new property' do
            property = Property.add(description: "property_1", price: 5, name: "testname", available_from: "01/10/2022", available_until: "01/12/2022")

            persisted_data = persisted_data(id: property.id)

            expect(property).to be_a Property
            expect(property.id).to eq persisted_data['id']
            expect(property.description).to eq "property_1"
            expect(property.price).to eq "5"
            expect(property.name).to eq "testname"
            expect(property.available_from).to eq "01/10/2022"
            expect(property.available_until).to eq "01/12/2022"
        end
    end

    describe '.all' do
        it 'displays multiple properties after multiple properties are added' do
            property = Property.add(description: "property_1", price: 5, name: "testname", available_from: "01/10/2022", available_until: "01/12/2022")
            Property.add(description: "property_2", price: 10, name: "testname2", available_from: "01/10/2022", available_until: "01/12/2022")

            properties = Property.all

            expect(properties.length).to eq 2 
            expect(properties.first).to be_a Property
            expect(properties.first.id).to eq property.id
            expect(properties.first.description).to eq 'property_1'
            expect(property.price).to eq "5"
            expect(property.name).to eq "testname"
            expect(property.available_from).to eq "01/10/2022"
            expect(property.available_until).to eq "01/12/2022"

            expect(properties.last).to be_a Property
            expect(properties.last.description).to eq 'property_2'
        end
    end
end