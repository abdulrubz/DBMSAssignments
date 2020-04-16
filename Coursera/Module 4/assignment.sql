-- List the city, state, and zip codes in the customer table.  Your result should not have duplicates. (Hint: The DISTINCT keyword eliminates duplicates.)

select distinct City, State, Zip 
from Customer;

-- +------------+-------+-------+
-- | City       | State | Zip   |
-- +------------+-------+-------+
-- | Boulder    | CO    | 80309 |
-- | Louisville | CO    | 80027 |
-- +------------+-------+-------+



-- List the name, department, phone number, and email address of employees with a phone number beginning with “3-”.

select EmpName, Department, Phone, Email
from Employee
where Phone like "3-%";

-- +--------------------+----------------+--------+--------------------+
-- | EmpName            | Department    | Phone  | Email              |
-- +--------------------+----------------+--------+--------------------+
-- | Chuck Coordinator  | Administration | 3-1111 | chuck@colorado.edu |
-- | Sally Supervisor   | Planning       | 3-2222 | sally@colorado.edu |
-- | Alan Administrator | Administration | 3-3333 | alan@colorado.edu  |
-- +--------------------+----------------+--------+--------------------+


--List all columns of the resource table with a rate between $10 and $20. Sort the result by rate.

select * from ResourceTbl
where Rate between 10 and 20
order by Rate;

-- +-------+--------------+-------+
-- | ResNo | ResName      | Rate  |
-- +-------+--------------+-------+
-- | R100  | attendant    | 10.00 |
-- | R102  | usher        | 10.00 |
-- | R105  | food service | 10.00 |
-- | R101  | police       | 15.00 |
-- | R104  | janitor      | 15.00 |
-- | R103  | nurse        | 20.00 |
-- +-------+--------------+-------+


--List the event requests with a status of “Approved” or “Denied” and an authorized date in July 2018. Include the event number, authorization date, and status in the output. 

select EventNo, DateAuth, Status
from EventRequest
where Status="Approved" or Status="Denied"
and DateAuth between '2018-07-01' and '2018-07-31';

-- +---------+------------+----------+
-- | EventNo | DateAuth   | Status   |
-- +---------+------------+----------+
-- | E100    | 2018-06-08 | Approved |
-- | E102    | 2018-07-31 | Approved |
-- | E103    | 2018-08-01 | Approved |
-- | E104    | 2018-07-31 | Approved |
-- | E105    | 2018-08-01 | Approved |
-- | E106    | 2018-07-31 | Approved |
-- | E107    | 2018-07-31 | Denied   |
-- +---------+------------+----------+


--List the location number and name of locations that are part of the “Basketball arena”.  Your WHERE clause should not have a condition involving the facility number compared to a constant (“F101”). Instead, you should use a condition on the FacName column for the value of “Basketball arena”

select LocNo, LocName 
from Facility, Location 
where FacName="Basketball arena"
and Facility.FacNo = Location.FacNo;

-- +-------+-------------+
-- | LocNo | LocName     |
-- +-------+-------------+
-- | L103  | Locker room |
-- | L105  | Gate        |
-- +-------+-------------+


--For each event plan, list the plan number, count of the event plan lines, and sum of the number of resources assigned.  For example, plan number “P100” has 4 lines and 7 resources assigned.  You only need to consider event plans that have at least one line.

select PlanNo, count(LineNo) as LineCount, sum(NumberFld) as TotalNumberFlds
from EventPlanLine
group by PlanNo;

-- +--------+-----------+-----------------+
-- | PlanNo | LineCount | TotalNumberFlds |
-- +--------+-----------+-----------------+
-- | P100   |         4 |               7 |
-- | P101   |         3 |               8 |
-- | P102   |         3 |               8 |
-- | P103   |         3 |               8 |
-- | P104   |         2 |               8 |
-- | P105   |         2 |               8 |
-- | P199   |         1 |               1 |
-- | P349   |         1 |               1 |
-- | P85    |         3 |              10 |
-- | P95    |         5 |              16 |
-- +--------+-----------+-----------------+
