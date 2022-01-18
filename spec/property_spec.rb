require 'property'

describe 'property' do
    describe '.add' do
        it 'should add property' do
            property = Property.add(property: "property_1")
            expect(property.first['description']).to eq "property_1"
        end

        it 'should add multiple properties' do
            property = Property.add(property: "property_1")
            Property.add(property: "property_2")

            p 'property variable: ', property
            # returns #<PG::Result:0x00007fe490130f20 status=PGRES_TUPLES_OK ntuples=1 nfields=1 cmd_tuples=1>

            expect(Property.all).to include "property_1" #property.first['description']
            expect(Property.all).to include "property_2"
        end
    end
end