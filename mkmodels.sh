#!/bin/bash
rails generate model companies company_name:string{100}, operator_num:integer
rails generate model fields field_name:string{100}, field_code:string{20}
rails generate model formations formation:string{}, formation_code:string
rails generate model gastypes gas_type:string{25}
rails generate model counties county_name:string{30}
rails generate model facilities facility_num:integer, facility_name:string{50}, qtrqtr:string{6}, sec:integer, township:string{10}, meridian:string{5}, latitude:decimal, longitude:decimal, ground_elevation:integer, utm_x:integer, utm_y:integer
rails generate model wells well_name:string, api_county_code:integer, api_seq_num:integer, sidetrack_num:integer, api_num:string{50}, formation_code:string{10}, spuddate:date, td_date:date, wb_meas_depth:integer, wb_tvd:integer, test_date:date, well_bore_status:string{5}, status_date:date, first_prod_dat
rails generate model fields_formations fields_id:integer, formations_id:integer