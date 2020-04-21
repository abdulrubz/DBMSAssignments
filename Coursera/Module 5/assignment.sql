--For event requests, list the event number, event date (eventrequest.dateheld), and count of the event plans.  Only include event requests in the result if the event request has more than one related event plan with a work date in December 2018.

select EventRequest.EventNo, DateHeld, count(*) as PlanCount
from EventRequest, EventPlan
where EventRequest.EventNo = EventPlan.EventNo
and WorkDate between '2018-12-01' and '2018-12-31'
group by EventNo
having count(*) > 1;

-- +---------+------------+-----------+
-- | EventNo | DateHeld   | PlanCount |
-- +---------+------------+-----------+
-- | E106    | 2018-12-12 |         2 |
-- +---------+------------+-----------+



--List the plan number, event number, work date, and activity of event plans meeting the following two conditions: (1) the work date is in December 2018 and (2) the event is held in the “Basketball arena”.  Your query must not use the facility number (“F101”) of the basketball arena in the WHERE clause. Instead, you should use a condition on the FacName column for the value of “Basketball arena”.

select PlanNo, EventPlan.EventNo, WorkDate, Activity
from EventPlan, EventRequest, Facility
where EventPlan.EventNo = EventRequest.EventNo
and EventRequest.FacNo = Facility.FacNo
and WorkDate between '2018-12-01' and '2018-12-31'
and Facility.FacName = "Basketball arena";

-- +--------+---------+------------+-----------+
-- | PlanNo | EventNo | WorkDate   | Activity  |
-- +--------+---------+------------+-----------+
-- | P101   | E104    | 2018-12-03 | Operation |
-- | P102   | E105    | 2018-12-05 | Operation |
-- | P103   | E106    | 2018-12-12 | Operation |
-- | P349   | E106    | 2018-12-12 | Setup     |
-- +--------+---------+------------+-----------+



--List the event number, event date, status, and estimated cost of events where there is an event plan managed by Mary Manager and the event is held in the basketball arena in the period October 1 to December 31, 2018.  Your query must not use the facility number (“F101”) of the basketball arena or the employee number (“E101”) of “Mary Manager” in the WHERE clause. Thus, the WHERE clause should not have conditions involving the facility number or employee number compared to constant values.

select EventRequest.EventNo, DateHeld, Status, Estcost
from EventRequest, Facility, EventPlan, Employee 
where EventRequest.FacNo = Facility.FacNo
and EventRequest.EventNo = EventPlan.EventNo
and EventPlan.EmpNo = Employee.EmpNo
and EmpName = "Mary Manager"
and FacName = "Basketball arena"
and DateHeld between '2018-10-01' and '2018-12-31';

-- +---------+------------+----------+---------+
-- | EventNo | DateHeld   | Status   | Estcost |
-- +---------+------------+----------+---------+
-- | E106    | 2018-12-12 | Approved | 2000.00 |
-- +---------+------------+----------+---------+



-- List the plan number, line number, resource name, number of resources (eventplanline.number), location name, time start, and time end where the event is held at the basketball arena, the event plan has activity of activity of “Operation”, and the event plan has a work date in the period October 1 to December 31, 2018.  Your query must not use the facility number (“F101”) of the basketball arena in the WHERE clause. Instead, you should use a condition on the FacName column for the value of “Basketball arena”.

select EventPlanLine.PlanNo, EventPlanLine.line, ResName, NumberFld, LocName, TimeStart, TimeEnd
from EventPlanLine, EventPlan, ResourceTbl, Location, Facility
where EventPlanLine.ResNo = ResourceTbl.ResNo 
and EventPlanLine.LocNo = Location.LocNo 
and Location.FacNo = Facility.FacNo 
and EventPlanLine.PlanNo = EventPlan.PlanNo 
and FacName = "Basketball arena"
and Activity = "Operation"
and WorkDate between '2018-12-01' and '2018-12-31';


-- +--------+-----+-----------+-----------+-------------+---------------------+---------------------+
-- | PlanNo | line | ResName   | NumberFld | LocName     | TimeStart           | TimeEnd             |
-- +--------+-----+-----------+-----------+-------------+---------------------+---------------------+
-- | P101   | 1   | attendant |         2 | Locker room | 2018-12-03 18:00:00 | 2018-12-03 20:00:00 |
-- | P101   | 2   | attendant |         4 | Gate        | 2018-12-03 18:30:00 | 2018-12-03 19:00:00 |
-- | P101   | 3   | nurse     |         2 | Locker room | 2018-12-03 19:00:00 | 2018-12-03 20:00:00 |
-- | P102   | 1   | attendant |         2 | Locker room | 2018-12-05 18:00:00 | 2018-12-05 19:00:00 |
-- | P102   | 2   | attendant |         4 | Gate        | 2018-12-05 18:00:00 | 2018-12-05 21:00:00 |
-- | P102   | 3   | nurse     |         2 | Locker room | 2018-12-05 19:00:00 | 2018-12-05 22:00:00 |
-- | P103   | 1   | attendant |         2 | Locker room | 2018-12-12 18:00:00 | 2018-12-12 21:00:00 |
-- | P103   | 2   | attendant |         4 | Gate        | 2018-12-12 18:00:00 | 2018-12-12 21:00:00 |
-- | P103   | 3   | nurse     |         2 | Locker room | 2018-12-12 19:00:00 | 2018-12-12 22:00:00 |
-- +--------+-----+-----------+-----------+-------------+---------------------+---------------------+



--Insert a new row into the Facility table with facility name “Swimming Pool”.

insert into Facility values ("F104", "Swimming Pool");

--Query OK, 1 row affected (0.01 sec)



-- Insert a new row in the Location table related to the Facility row in modification problem 1. The new row should have “Door” for the location name.

insert into Location values ("L107", "F104", "Door");

--Query OK, 1 row affected (0.01 sec)



-- Insert a new row in the Location table related to the Facility row in modification problem 1. The new row should have “Locker Room” for the location name.

insert into Location values ("L108", "F104", "Locker Room");