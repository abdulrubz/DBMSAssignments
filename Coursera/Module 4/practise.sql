-- List the customer number, the name, the phone number, and the city of customers.

select CustNo, CustName, Phone, City 
from Customer;

-- +--------+----------------------+---------+------------+
-- | CustNo | CustName             | Phone   | City       |
-- +--------+----------------------+---------+------------+
-- | C100   | Football             | 6857100 | Boulder    |
-- | C101   | Men's Basketball     | 5431700 | Boulder    |
-- | C103   | Baseball             | 5431234 | Boulder    |
-- | C104   | Women's Softball     | 5434321 | Boulder    |
-- | C105   | High School Football | 4441234 | Louisville |
-- +--------+----------------------+---------+------------+


--List the customer number, the name, the phone number, and the city of customers who reside in Colorado (State is CO).

select CustNo, CustName, Phone, City 
from Customer 
where State = "CO";

-- +--------+----------------------+---------+------------+
-- | CustNo | CustName             | Phone   | City       |
-- +--------+----------------------+---------+------------+
-- | C100   | Football             | 6857100 | Boulder    |
-- | C101   | Men's Basketball     | 5431700 | Boulder    |
-- | C103   | Baseball             | 5431234 | Boulder    |
-- | C104   | Women's Softball     | 5434321 | Boulder    |
-- | C105   | High School Football | 4441234 | Louisville |
-- +--------+----------------------+---------+------------+


--List all columns of the EventRequest table for events costing more than $4000.  Order the result by the event date (DateHeld)

select * 
from EventRequest 
where Estcost>4000.00 
order by DateHeld;

-- +---------+------------+------------+-------+--------+------------+----------+----------+-------------+-------+
-- | EventNo | DateHeld   | DateReq    | FacNo | CustNo | DataAuth   | Status   | Estcost  | Estaudience | BudNo |
-- +---------+------------+------------+-------+--------+------------+----------+----------+-------------+-------+
-- | E102    | 2018-09-14 | 2018-07-28 | F100  | C100   | 2018-07-31 | Approved |  5000.00 |       80000 | B1000 |
-- | E103    | 2018-09-21 | 2018-07-28 | F100  | C100   | 2018-08-01 | Approved |  5000.00 |       80000 | B1000 |
-- | E100    | 2018-10-25 | 2018-06-06 | F100  | C100   | 2018-06-08 | Approved |  5000.00 |       80000 | B1000 |
-- | E101    | 2018-10-26 | 2018-07-28 | F100  | C100   | NULL       | Pending  |  5000.00 |       80000 | B1000 |
-- | E107    | 2018-11-23 | 2018-07-28 | F100  | C105   | 2018-07-31 | Denied   | 10000.00 |        5000 | NULL  |
-- +---------+------------+------------+-------+--------+------------+----------+----------+-------------+-------+


--List the event number, the event date (DateHeld), and the estimated audience number with approved status and audience greater than 9000 or with pending status and audience greater than 7000.

select EventNo, DateHeld, Estaudience 
from EventRequest
where (Status='Approved' AND Estaudience>9000)
OR (Status='Pending' OR Estaudience>7000);

-- +---------+------------+-------------+
-- | EventNo | DateHeld   | Estaudience |
-- +---------+------------+-------------+
-- | E100    | 2018-10-25 |       80000 |
-- | E101    | 2018-10-26 |       80000 |
-- | E102    | 2018-09-14 |       80000 |
-- | E103    | 2018-09-21 |       80000 |
-- | E104    | 2018-12-03 |       12000 |
-- | E105    | 2018-12-05 |       10000 |
-- | E106    | 2018-12-12 |       10000 |
-- +---------+------------+-------------+

--List the event number, event date (DateHeld), customer number and customer name of events placed in December 2018 by customers from Boulder.

select EventNo, DateHeld, Customer.CustNo, CustName
from EventRequest inner join Customer
on EventRequest.CustNo = Customer.CustNo
where DateHeld between '2018-12-01' and '2018-12-30'
and City='Boulder';

-- +---------+------------+--------+------------------+
-- | EventNo | DateHeld   | CustNo | CustName         |
-- +---------+------------+--------+------------------+
-- | E104    | 2018-12-03 | C101   | Men's Basketball |
-- | E105    | 2018-12-05 | C101   | Men's Basketball |
-- | E106    | 2018-12-12 | C101   | Men's Basketball |
-- +---------+------------+--------+------------------+

--List the average number of resources used (NumberFld) by plan number. Include only location number L100.

select PlanNo, AVG(NumberFld) as AvgNumField
from EventPlanLine
where LocNo="L100"
group by PlanNo;

-- +--------+-------------+
-- | PlanNo | AvgNumField |
-- +--------+-------------+
-- | P100   |      2.0000 |
-- | P104   |      4.0000 |
-- | P105   |      4.0000 |
-- | P199   |      1.0000 |
-- | P85    |      5.0000 |
-- | P95    |      3.0000 |
-- +--------+-------------+

--List the average number of resources used (NumberFld) by plan number. Only include location number L100. Eliminate plans with less than two event lines containing location number L100.

select PlanNo, AVG(NumberFld) as AvgNumberFld, count(*) as Count
from EventPlanLine
where LocNo="L100"
group by PlanNo
having count(*) > 1;

-- +--------+--------------+-------+
-- | PlanNo | AvgNumberFld | Count |
-- +--------+--------------+-------+
-- | P100   |       2.0000 |     2 |
-- | P95    |       3.0000 |     2 |
-- +--------+--------------+-------+

