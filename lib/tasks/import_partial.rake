#lib/tasks/import_partial.rake
require 'csv'
desc "Imports the COGCC CSV file into wikifrac database"
# Notes:
# - must create records in the independent tables first, so that the foreign key id's
#   can be populated in the dependent fields.
# - when populating dependent tables, must not duplicate records
#
# Independent tables:
#  Companies
#  Counties
#  Fields
#  Formations
#  Gastypes
#  Wells
#  
# Dependendecies and foreign key field used to find correct record id:
#  Facilities.company_id -> Companies.company_name
#  Facilities.field_id   -> Fields.field_name
#  Facilities.county_id  -> Counties.county_name
#  Wells.gastype_id      -> GasTypes.gas_type
#
task :import_partial => :environment do    
    csv.foreach('public/partial.csv', :headers => true) do |row|

            # create records in independent tables
      
            # do the Company object
            this_company_name = row.to_hash.slice(*%w[county_name])
            if !(Company.exists?(company_name: this_company_name))
              Companies.create(row.to_hash.slice(*%w[company_name operator_num])
            end
            thecompany = Company.find(this_company_name)
            company_id = thecompany.id
            
            # do the County object
            this_county_name = row.to_hash.slice(*%w[county])
            if !(County.exists?(county_name: this_county_name))
              Counties.create(county_name: this_county_name)
            end
            thecounty = County.find(this_county_name)
            county_id = thecounty.id
                             
            # do the GasType object  
            this_gastype_name = row.to_hash.slice(*%w[gas_type])
            if !(GasType.exists?(gastype_name: this_gastype_name))
              GasType.create(gastype_name: this_gastype_name)
            end
            thegastype = GasType.find(this_gastype_name)
            gastype_id = thegastype.id
      
                            
            # do the Field object
            this_field_name = row.to_hash.slice(*%w[field])
            if !(Field.exists?(field_name: this_field_name))
              Field.create(field_name: this_field_name, field_code: field_code)
            end
            thefield = Field.find(this_field_name)
            field_id = thefield.id
                          
            # do the Formations object  
            this_formation_name = row.to_hash.slice(*%w[formation])
            if !(Formation.exists?(formation_name: this_formation_name))
              Counties.create(formation: this_formation_name, formation_code: formation_code)
            end
            theformation = Formation.find(this_formation_name)
            formation_id = theformation.id
            
            # debugging:
            puts "company_id:", company_id
            puts "county_id:", county_id
            puts "gastype_id:", gastype_id
            puts "field_id:", field_id
      
            # create records in dependent tables:
            # Use the record id's from above independent table create records containing foreign keys:
                  
            #Facilities.create(row.to_hash.slice(*%w[dir_e_w dir_n_s dist_e_w dist_n_s facility_name facility_num ground_elev lat long meridian qtrqtr range sec twp utm_x utm_y])
                              
            #Wells.create(row.to_hash.slice(*%w[api_county_code api_seq_num first_prod_date form_status_date formation_status sidetrack_num spud_date status_date td_date test_date wbmeasdepth wbtvd well_bore_status well_name])
                            
            # Now: how to identify the foreign key records and populate foreign key ids?
            # Need the following:
            # when creating Facilities record:
            #  following records need to have been created: Companies, Counties, Fields, Wells
            #
            # when creating Wells record need to know id's for: Facility, GasType
            # when creating Facilities record need to know id's for: Company, County, Field, Well
            # when creating Field record need to know id for: Formation
            # when creating Formation record need to know id for: Field 
      
        end
    end
end