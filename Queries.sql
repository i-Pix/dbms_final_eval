/* Find total number of business class seats available on any Metro that reaches Delhi Main before 7AM on Monday*/
drop view A;
drop view B;
drop view C;

create view A (station_code,metro_no,arrival_Time) AS
    SELECT stoppage.station_code, metro_no, arrival_time
    from station inner join stoppage on station.station_code=stoppage.station_code 
    where station.station_name='Jahangirpuri';

select * from A;

create view B (station_code,metro_no,arrival_time) AS
    SELECT station_code, metro_no, arrival_time
    from A 
    where EXTRACT(HOUR FROM arrival_Time) < 7;

select * from B;

create view C (station_code, metro_no, arrival_time, business_class_seats, run_on_monday) AS
    SELECT station_code, metro.metro_no, arrival_time, seat_business, run_on_monday
    from metro inner join B on metro.metro_No = B.Metro_No 
    where metro.run_on_monday='Y' AND metro.seat_business > 0;

select * from c;

SELECT SUM(business_class_seats)
FROM C;

/* Find the time at which last Metro leaves Adarsh Nagar station */

create view F (departure_time)as
    SELECT departure_time 
    FROM stoppage 
    WHERE station_code IN ( SELECT station_code 
                            FROM station 
                            WHERE station_name='Adarsh Nagar') ;
select * from F ;
select MAX(Departure_time) from F;

/* Find the phone number of the user whose email id is jack@gmail.com */

Select phone_no 
from contact 
where username IN (Select username 
                   from account 
                   where email_id='jack@gmail.com');