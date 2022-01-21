# Date stored in SQL: YYYY-MM-DD.    01/01/2022.      10/01/2022

def create_date_array(start_date:, end_date:)  
  require 'date'

  start_date_object = Date.parse(start_date)
  end_date_object = Date.parse(end_date) 
  dates = [start_date]
  
  puts "pre-looping"
  date = start_date_object
  until date == end_date_object
    date += 1
    dates << date.to_s
  end

  dates
end

def available_date_array(available_from:, available_until:)
  total_available_array = create_date_array(available_from, available_until)
  total_available_array - booked_dates(@id)
end

private
def booked_dates(id:)
  find requests with id=id and status=approved
  return array
end

# request form

# start date: available_date_array
# [show more dates]
# end date: available_date_array 