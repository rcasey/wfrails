#lib/tasks/import_partial.rake
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
#  Wells.gastype_id      -> Gastypes.gas_type
#
# when creating Wells record need to know id's for: Facility, Gastype
# when creating Facilities record need to know id's for: Company, County, Field, Well
# when creating Field record need to know id for: Formation
# when creating Formation record need to know id for: Field


def get_value value
  
  begin
  
    # Debugging:
    puts "in get_value: " + value.to_s
  
    if value.nil?    
        rtnval = ""
        puts 'Nil value detected here!'
    end
  
  rescue
    puts "Some error occurred in get_value, with value = (#{value})"
  else
    rtnval = value
  end
  
  return rtnval

end

desc "Imports the COGCC CSV file into wikifrac database"
task :import_cogcc => :environment do

    require 'csv'
    require 'pry'
    
    ndx = 0
    fldhrs = []
    
    CSV.foreach('public/partial.csv', :headers => false) do |row|
    
        if ndx == 0
          fldhrs = row
          puts "headers: " + fldhrs.to_s
          ndx = ndx +1
          next
        end

        # create records in independent tables
        
        # Test row for nil values, replace any nil values with empty string

        row.each_with_index {|val, index|          
          
          puts "-------- FIELD # #{index.to_s}, #{fldhrs[index]} -------"
          #puts "index: " + index.to_s + ", before: " + row[index].to_s + ", header: " + fldhrs[index]
          row[index] = get_value( row[index] )
          puts "after " + row[index].to_s
          
        }
        

        # create the Company object
        this_company_name = row['name']
        this_operator_num = row['operator_num']
        
        if !(Companies.exists?(:company_name => this_company_name))
          Companies.create(company_name: this_company_name, operator_num: this_operator_num)
        end
        thecompany = Companies.find_by(company_name: this_company_name)
        company_id = thecompany.id
        
        # create the County object
        this_county_name = row['county']
        if !(Counties.exists?(county_name: this_county_name))
          Counties.create(county_name: this_county_name)
        end
        thecounty = Counties.find_by(county_name: this_county_name)
        county_id = thecounty.id
                         
        # create the Gastype object  
        this_gastype_name = row['gas_type']
        if !(Gastypes.exists?(gas_type: this_gastype_name))
          Gastypes.create(gas_type: this_gastype_name)
        end
        thegastype = Gastypes.find_by(gas_type: this_gastype_name)
        gastype_id = thegastype.id
    
        # debugging:
        #puts "Debugging:"
        #puts "company_id:", company_id
        #puts "county_id:", county_id
        #puts "gastype_id:", gastype_id
                        
        # create the Field object
        this_field_name = row['field_name']
        this_field_code = row['field_code']
        if !(Fields.exists?(field_name: this_field_name))
          Fields.create(field_name: this_field_name, field_code: this_field_code)
        end
        thisfield = Fields.find_by(field_name: this_field_name)
        field_id = thisfield.id
                      
        # create the Formations object  
        this_formation_name = row['formation']
        this_formation_code = row['formation_code']
        if !(Formations.exists?(formation: this_formation_name))
          Formations.create(formation: this_formation_name, formation_code: this_formation_code)
        end
        theformation = Formations.find_by(formation: this_formation_name)
        formation_id = theformation.id
        
        #puts "field_id:", field_id
        #puts "formation_id:", formation_id
    
        # Now create records in dependent tables:
        # Use the record id's from above independent table create records containing foreign keys:
        # for the Facilities record:
        #company_id
        #field_id
        #county_id

        # for the Wells record:
        #facilities_id
        #gastype_id

              
        # create the Facilities object
        this_facility_name  = row['facility_name']
        
        facility_num  = row['facility_num']
        ground_elev  = row['ground_elev']
        lat  = row['lat']
        long  = row['long']
        meridian  = row['meridian']
        range  = row['range']
        utm_x  = row['utm_x']
        utm_y  = row['utm_y']

        if !(Facilities.exists?(facility_name: this_facility_name))
          Facilities.create(
            facility_name: this_facility_name,
            facility_num: facility_num,
            ground_elevation: ground_elev,
            latitude: lat,
            longitude: long,
            meridian: meridian,
            utm_x: utm_x,
            utm_y: utm_y,
            company_id: company_id,
            field_id: field_id,
            county_id: county_id)
        end
        the_facility = Facilities.find_by(facility_name: this_facility_name)
        the_facility_id = the_facility.id


                          
        # create the Wells object
        api_county_code = row['api_county_code']
                
puts 'testing row[api_num]...'
if row['api_num'].nil?
  puts 'row[api_num] is nil...'
end

        api_num = row['api_num']
        api_seq_num = row['api_seq_num']
        dir_e_w = row['dir_e_w']
        dir_n_s = row['dir_n_s']
        dist_e_w = row['dist_e_w']
        dist_n_s = row['dist_n_s']
        first_prod_date = row['first_prod_date']
        form_status_date = row['form_status_date']
        formation_status = row['formation_status']
        qtrqtr = row['qtrqtr']
        sec = row['sec']
        sidetrack_num = row['sidetrack_num']
        spud_date = row['spud_date']
        status_date = row['status_date']
        td_date = row['td_date']
        test_date = row['test_date']
        twp  = row['twp']
        wbmeasdepth = row['wbmeasdepth']
        wbtvd = row['wbtvd']
        well_bore_status = row['well_bore_status']
        well_name = row['well_name']
        
        
        Wells.create(
          api_county_code: api_county_code,
          api_seq_num: api_seq_num,
          dir_e_w: dir_e_w,
          dir_n_s: dir_n_s,
          dist_e_w: dist_e_w,
          dist_n_s: dist_n_s,
          first_prod_date: first_prod_date,
          form_status_date: form_status_date,
          formation_status: formation_status,
          sidetrack_num: sidetrack_num,
          spud_date: spud_date,
          status_date: status_date,
          td_date: td_date,
          test_date: test_date,
          wbmeasdepth: wbmeasdepth,
          wbtvd: wbtvd,
          well_bore_status: well_bore_status,
          well_name: well_name,
          facility_id: the_facility_id,
          gastype_id: gastype_id)
                        
    end
end