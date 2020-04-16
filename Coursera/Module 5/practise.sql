--List the event number, date held, customer number, customer name, facility number, and facility name of 2018 events placed by Boulder customers.

select EventNo, DateHeld, Customer.CustNo, CustName, Facility.FacNo, FacName
from EventRequest, Customer, Facility 
where EventRequest.CustNo = Customer.CustNo
and EventRequest.FacNo = Facility.FacNo
and DateHeld between '2018-01-01' and '2018-12-31'
and City = "Boulder";

-- +---------+------------+--------+------------------+-------+------------------+
-- | EventNo | DateHeld   | CustNo | CustName         | FacNo | FacName          |
-- +---------+------------+--------+------------------+-------+------------------+
-- | E100    | 2018-10-25 | C100   | Football         | F100  | Football stadium |
-- | E101    | 2018-10-26 | C100   | Football         | F100  | Football stadium |
-- | E102    | 2018-09-14 | C100   | Football         | F100  | Football stadium |
-- | E103    | 2018-09-21 | C100   | Football         | F100  | Football stadium |
-- | E104    | 2018-12-03 | C101   | Men's Basketball | F101  | Basketball arena |
-- | E105    | 2018-12-05 | C101   | Men's Basketball | F101  | Basketball arena |
-- | E106    | 2018-12-12 | C101   | Men's Basketball | F101  | Basketball arena |
-- +---------+------------+--------+------------------+-------+------------------+


--List the customer number, customer name, event number, date held, facility number, facility name, and estimated audience cost per person (EstCost / EstAudience) for events held on 2018, in which the estimated cost per person is less than $0.2

select Customer.CustNo, CustName, EventNo, DateHeld, Facility.FacNo, FacName, (Estcost/Estaudience) as CostPerPerson
from EventRequest, Facility, Customer 
where EventRequest.CustNo = Customer.CustNo
and EventRequest.FacNo = Facility.FacNo 
and DateHeld between '2018-01-01' and '2018-12-31'
and Estcost/Estaudience < 0.2;

-- +--------+------------------+---------+------------+-------+------------------+---------------+
-- | CustNo | CustName         | EventNo | DateHeld   | FacNo | FacName          | CostPerPerson |
-- +--------+------------------+---------+------------+-------+------------------+---------------+
-- | C100   | Football         | E100    | 2018-10-25 | F100  | Football stadium |      0.062500 |
-- | C100   | Football         | E101    | 2018-10-26 | F100  | Football stadium |      0.062500 |
-- | C100   | Football         | E102    | 2018-09-14 | F100  | Football stadium |      0.062500 |
-- | C100   | Football         | E103    | 2018-09-21 | F100  | Football stadium |      0.062500 |
-- | C101   | Men's Basketball | E104    | 2018-12-03 | F101  | Basketball arena |      0.166667 |
-- +--------+------------------+---------+------------+-------+------------------+---------------+


--List the customer number, customer name, and total estimated costs for Approved events. The total amount of events is the sum of the estimated cost for each event. Group the results by customer number and customer name.

select Customer.CustNo, CustName, sum(Estcost) 
from Customer, EventRequest
where Status ="Approved"
and EventRequest.CustNo = Customer.CustNo
group by Customer.CustNo, CustName;


-- +--------+------------------+--------------+
-- | CustNo | CustName         | sum(Estcost) |
-- +--------+------------------+--------------+
-- | C100   | Football         |     15000.00 |
-- | C101   | Men's Basketball |      6000.00 |
-- +--------+------------------+--------------+


-- Insert yourself as a new row in the Customer table.

insert into Customer values ("C333", "Abdul Rub", "211 Hyderabad", "Y", "Rayyan M", "82482744", "Hyderabad", "TS", "50000");

-- Query OK, 1 row affected (0.01 sec)



-- Delete the new row added to the Customer table.

delete from Customer 
where CustNo = "C333";

-- Query OK, 1 row affected (0.01 sec)