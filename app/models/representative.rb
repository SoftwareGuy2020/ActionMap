# frozen_string_literal: true

class Representative < ApplicationRecord
    has_many :news_items, dependent: :delete_all

    def self.civic_api_to_representative_params(rep_info)
        reps = []

        rep_info.officials.each_with_index do |official, index|
            ocdid_temp = ''
            title_temp = ''

            rep_info.offices.each do |office|
                next unless office.official_indices.include? index

                title_temp = office.name
                ocdid_temp = office.division_id
            end
            reps.push(Representative.find_or_create_by!({ name: official.name, ocdid: ocdid_temp,
                                           title: title_temp, address: address_parser(official),
                                            party: official.party, photo: official.photo_url }))
        end
        reps
    end

    def self.address_parser(official)
        address_string = ''
        unless official.address.nil?
            address_temp = official.address[0]
            address_string = address_helper(address_temp)
            address_string += address_temp.city + ', ' + address_temp.state + ' ' + address_temp.zip
        end
        address_string
    end

    def self.address_helper(address)
        temp = address.line1 + '\n'
        temp += + address.line2 + '\n' unless address.line2.nil?
        temp += + address.line3 + '\n' unless address.line3.nil?
        temp
    end
end
