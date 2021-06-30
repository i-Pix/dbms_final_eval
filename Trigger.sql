create or replace trigger cancellation 
 before delete on Ticket 
 for each row
declare
    metrono metro.metro_no%type;
    ticketno passenger.ticket_no%type;
    p_class passenger.class%type;
BEGIN
    metrono := :old.metro_no;
    ticketno := :old.ticket_no;
    select class into p_class
    from passenger
    where ticket_no = ticketno;
  if p_class='general' then    
    UPDATE Metro 
    set Seat_General = Seat_General + 1 
    WHERE Metro_No = metrono;   
  elsif p_class='economy' then        
    UPDATE Metro 
    set Seat_economy = Seat_economy + 1 
    WHERE Metro_No = metrono ;   
  elsif p_class='executive' then       
    UPDATE Metro 
    set Seat_Executive = Seat_Executive + 1 
    WHERE Metro_No = metrono ;    
  elsif p_class='business' then        
    UPDATE Metro 
    set Seat_Business = Seat_Business + 1 
    WHERE Metro_No = metrono ;      
  end if; 
END;
/

delete from ticket where ticket_no = 10001;