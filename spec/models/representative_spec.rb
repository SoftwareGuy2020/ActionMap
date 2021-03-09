# frozen_string_literal: true

require 'rails_helper.rb'

describe 'Searching for representatives should not add duplicates to database' do
    context 'refreshing a search multiple times' do
        it 'returns an array of representatives' do
            sample_info = double('Google::Apis::CivicinfoV2::RepresentativeInfoResponse')
            stub_official = [double('Google::Apis::CivicinfoV2::Official', name: 'Donald J. Trump', address: nil,
                            party: 'Republican Party', photo_url: '')]

            allow(stub_official[0]).to receive_message_chain(:address, nil?: true)
            allow(sample_info).to receive_messages(officials: stub_official)

            stub_offices = [double('Google::Apis::CivicinfoV2::Office')]
            allow(stub_offices[0]).to receive_messages(official_indices: double('indicies', include?: true))
            allow(stub_offices[0]).to receive_messages(name: 'Donald J. Trump')
            allow(stub_offices[0]).to receive_messages(division_id: 'ocd-division/country:us')

            allow(sample_info).to receive_messages(offices: stub_offices)

            # first round
            result = Representative.civic_api_to_representative_params(sample_info)
            expect(result.size).to be >= 1
            total = Representative.count
            # second round
            Representative.civic_api_to_representative_params(sample_info)
            expect(Representative.count).to eq(total) # checks for duplicates after second call
        end
    end
end

describe 'Searching for representatives should return a list of representatives' do
    context 'searching for representatives' do
        it 'returns an array of representatives' do
            sample_info = double('Google::Apis::CivicinfoV2::RepresentativeInfoResponse')
            stub_official = [double('Google::Apis::CivicinfoV2::Official', name: 'Donald J. Trump', address: nil,
                            party: 'Republican Party', photo_url: '')]

            allow(sample_info).to receive_messages(officials: stub_official)
            stub_offices = [double('Google::Apis::CivicinfoV2::Office')]
            allow(stub_offices[0]).to receive_message_chain(:official_indices, include?: true)
            allow(stub_offices[0]).to receive_messages(name: 'Donald J. Trump')
            allow(stub_offices[0]).to receive_messages(division_id: 'ocd-division/country:us')
            allow(sample_info).to receive_messages(offices: stub_offices)

            result = Representative.civic_api_to_representative_params(sample_info)
            expect(result.size).to eq(1) # should return one representative
            expect(result[0].name).to eq('Donald J. Trump') # should match with info sent in
        end
    end
end
