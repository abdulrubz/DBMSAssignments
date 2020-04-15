create table Customer (
    CustNo varchar(8) not null,
    CustName varchar(20) not null,
    Address varchar(15) not null,
    Internal varchar(3) not null,
    Contact varchar(20) not null,
    Phone varchar(8) not null,
    City varchar(15) not null,
    State char(2) not null,
    Zip integer not null,
    primary key (CustNo)
);

insert into Customer values ('C100','Football','Box 352200','Y','Mary Manager','6857100','Boulder','CO','80309');
insert into Customer values ('C101','Men''s Basketball','Box 352400','Y','Sally Supervisor','5431700','Boulder','CO','80309');
insert into Customer values ('C103','Baseball','Box 352020','Y','Bill Baseball','5431234','Boulder','CO','80309');
insert into Customer values ('C104','Women''s Softball','Box 351200','Y','Sue Softball','5434321','Boulder','CO','80309');
insert into Customer values ('C105','High School Football','123 AnyStreet','N','Coach Bob','4441234','Louisville','CO','80027');



create table Employee (
    EmpNo varchar(8) not null,
    EmpName varchar(20) not null,
    Departnment varchar(20) not null,
    Email varchar(25) not null,
    Phone varchar(8) not null,
    primary key (EmpNo)
);

insert into Employee values ('E100','Chuck Coordinator','Administration','chuck@colorado.edu','3-1111');
insert into Employee values ('E101','Mary Manager','Football','mary@colorado.edu','5-1111');
insert into Employee values ('E102','Sally Supervisor','Planning','sally@colorado.edu','3-2222');
insert into Employee values ('E103','Alan Administrator','Administration','alan@colorado.edu','3-3333');
 

create table Facility (
    FacNo varchar(8) not null,
    FacName varchar(20) not null,
    primary key (FacNo)
);

insert into Facility values ('F100','Football stadium');
insert into Facility values ('F101','Basketball arena');
insert into Facility values ('F102','Baseball field');
insert into Facility values ('F103','Recreation room');


create table Location (
    LocNo varchar(8) not null,
    FacNo varchar(8),
    LocName varchar(20) not null,
    primary key (LocNo),
    foreign key (FacNo) references Facility(FacNo)
);

insert into Location values ('L100','F100','Locker room');
insert into Location values ('L101','F100','Plaza');
insert into Location values ('L102','F100','Vehicle gate');
insert into Location values ('L103','F101','Locker room');
insert into Location values ('L104','F100','Ticket Booth');
insert into Location values ('L105','F101','Gate');
insert into Location values ('L106','F100','Pedestrian gate');

create table ResourceTbl (
    ResNo varchar(8) not null,
    ResName varchar(20) not null,
    Rate decimal(8, 2),
    primary key (ResNo)
);

insert into ResourceTbl  values ('R100','attendant',10);
insert into ResourceTbl  values ('R101','police',15);
insert into ResourceTbl  values ('R102','usher',10);
insert into ResourceTbl  values ('R103','nurse',20);
insert into ResourceTbl  values ('R104','janitor',15);
insert into ResourceTbl  values ('R105','food service',10);

create table EventRequest (
    EventNo varchar(8) not null,
    DateHeld date not null,
    DateReq date not null,
    FacNo varchar(8),
    CustNo varchar(8),
    DataAuth date,
    Status varchar(10) not null,
    Estcost decimal(8, 2) not null, 
    Estaudience integer not null,
    BudNo varchar(8),
    primary key (EventNo),
    foreign key (FacNo) references Facility(FacNo),
    foreign key (CustNo) references Customer(CustNo)
);

insert into EventRequest (EventNo, DateHeld, DateReq, CustNo, FacNo, DataAuth, Status, Estcost, Estaudience, BudNo) values ('E100',str_to_date('25,OCT,18','%d,%b,%y'),str_to_date('06,JUN,18','%d,%b,%y'),'C100','F100',str_to_date('08,JUN,18','%d,%b,%y'),'Approved',5000,80000,'B1000');
insert into EventRequest (EventNo, DateHeld, DateReq, CustNo, FacNo, DataAuth, Status, Estcost, Estaudience, BudNo) values ('E101',str_to_date('26,OCT,18','%d,%b,%y'),str_to_date('28,JUL,18','%d,%b,%y'),'C100','F100',null,'Pending',5000,80000,'B1000');
insert into EventRequest (EventNo, DateHeld, DateReq, CustNo, FacNo, DataAuth, Status, Estcost, Estaudience, BudNo) values ('E103',str_to_date('21,SEP,18','%d,%b,%y'),str_to_date('28,JUL,18','%d,%b,%y'),'C100','F100',str_to_date('01,AUG,18','%d,%b,%y'),'Approved',5000,80000,'B1000');
insert into EventRequest (EventNo, DateHeld, DateReq, CustNo, FacNo, DataAuth, Status, Estcost, Estaudience, BudNo) values ('E102',str_to_date('14,SEP,18','%d,%b,%y'),str_to_date('28,JUL,18','%d,%b,%y'),'C100','F100',str_to_date('31,JUL,18','%d,%b,%y'),'Approved',5000,80000,'B1000');
insert into EventRequest (EventNo, DateHeld, DateReq, CustNo, FacNo, DataAuth, Status, Estcost, Estaudience, BudNo) values ('E104',str_to_date('03,DEC,18','%d,%b,%y'),str_to_date('28,JUL,18','%d,%b,%y'),'C101','F101',str_to_date('31,JUL,18','%d,%b,%y'),'Approved',2000,12000,'B1000');
insert into EventRequest (EventNo, DateHeld, DateReq, CustNo, FacNo, DataAuth, Status, Estcost, Estaudience, BudNo) values ('E105',str_to_date('05,DEC,18','%d,%b,%y'),str_to_date('28,JUL,18','%d,%b,%y'),'C101','F101',str_to_date('01,AUG,18','%d,%b,%y'),'Approved',2000,10000,'B1000');
insert into EventRequest (EventNo, DateHeld, DateReq, CustNo, FacNo, DataAuth, Status, Estcost, Estaudience, BudNo) values ('E106',str_to_date('12,DEC,18','%d,%b,%y'),str_to_date('28,JUL,18','%d,%b,%y'),'C101','F101',str_to_date('31,JUL,18','%d,%b,%y'),'Approved',2000,10000,'B1000');
insert into EventRequest (EventNo, DateHeld, DateReq, CustNo, FacNo, DataAuth, Status, Estcost, Estaudience, BudNo) values ('E107',str_to_date('23,NOV,18','%d,%b,%y'),str_to_date('28,JUL,18','%d,%b,%y'),'C105','F100',str_to_date('31,JUL,18','%d,%b,%y'),'Denied',10000,5000,null);


create table EventPlan (
    PlanNo varchar(8) not null,
    EventNo varchar(8),
    WorkDate date not null,
    Notes varchar(30),
    Activity varchar(15) not null,
    EmpNo varchar(8),
    primary key (PlanNo),
    foreign key (EventNo) references EventRequest(EventNo),
    foreign key (EmpNo) references Employee(EmpNo)
);


insert into EventPlan values ('P100','E100',str_to_date('25,OCT,18','%d,%b,%y'),'Standard operation','Operation','E102');
insert into EventPlan values ('P101','E104',str_to_date('03,DEC,18','%d,%b,%y'),'Watch for gate crashers','Operation','E100');
insert into EventPlan values ('P102','E105',str_to_date('05,DEC,18','%d,%b,%y'),'Standard operation','Operation','E102');
insert into EventPlan values ('P103','E106',str_to_date('12,DEC,18','%d,%b,%y'),'Watch for seat switching','Operation',null);
insert into EventPlan values ('P104','E101',str_to_date('26,OCT,18','%d,%b,%y'),'Standard cleanup','Cleanup','E101');
insert into EventPlan values ('P105','E100',str_to_date('25,OCT,18','%d,%b,%y'),'Light cleanup','Cleanup','E101');
insert into EventPlan values ('P199','E102',str_to_date('10,DEC,18','%d,%b,%y'),'ABC','Operation','E101');
insert into EventPlan values ('P299','E101',str_to_date('26,OCT,18','%d,%b,%y'),null,'Operation','E101');
insert into EventPlan values ('P349','E106',str_to_date('12,DEC,18','%d,%b,%y'),null,'Setup','E101');
insert into EventPlan values ('P85','E100',str_to_date('25,OCT,18','%d,%b,%y'),'Standard operation','Cleanup','E102');
insert into EventPlan values ('P95','E101',str_to_date('26,OCT,18','%d,%b,%y'),'Extra security','Cleanup','E102');

create table EventPlanLine (
    PlanNo varchar(8) not null,
    lin varchar(8) not null,
    TimeStart timestamp not null,
    TimeEnd timestamp not null,
    NumberFld integer not null,
    LocNo varchar(8) not null,
    ResNo varchar(8) not null,
    primary key (PlanNo, lin),
    foreign key (PlanNo) references EventPlan(PlanNo),
    foreign key (LocNo) references Location(LocNo),
    foreign key (ResNo) references ResourceTbl(ResNo)
);

insert into EventPlanLine values ('P100',1, str_to_date('25,OCT,18 8:00:00','%d,%b,%y %H:%i:%s'), str_to_date('25,OCT,18 17:00:00','%d,%b,%y %H:%i:%s'),2,'L100','R100');
insert into EventPlanLine values ('P100',2, str_to_date('25,OCT,18 12:00:00','%d,%b,%y %H:%i:%s'),str_to_date('25,OCT,18 17:00:00','%d,%b,%y %H:%i:%s'), 2,'L101','R101');
insert into EventPlanLine values ('P100',3, str_to_date('25,OCT,18 7:00:00','%d,%b,%y %H:%i:%s'), str_to_date('25,OCT,18 16:30:00','%d,%b,%y %H:%i:%s'), 1,'L102','R102');
insert into EventPlanLine values ('P100',4, str_to_date('25,OCT,18 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('25,OCT,18 22:00:00','%d,%b,%y %H:%i:%s'),2,'L100','R102');
insert into EventPlanLine values ('P101',1, str_to_date('3,DEC,18 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('3,DEC,18 20:00:00','%d,%b,%y %H:%i:%s'),2,'L103','R100');
insert into EventPlanLine values ('P101',2, str_to_date('3,DEC,18 18:30:00','%d,%b,%y %H:%i:%s'),str_to_date('3,DEC,18 19:00:00','%d,%b,%y %H:%i:%s'),4,'L105','R100');
insert into EventPlanLine values ('P101',3, str_to_date('3,DEC,18 19:00:00','%d,%b,%y %H:%i:%s'),str_to_date('3,DEC,18 20:00:00','%d,%b,%y %H:%i:%s'),2,'L103','R103');
insert into EventPlanLine values ('P102',1, str_to_date('5,DEC,18 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('5,DEC,18 19:00:00','%d,%b,%y %H:%i:%s'),2,'L103','R100');
insert into EventPlanLine values ('P102',2, str_to_date('5,DEC,18 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('5,DEC,18 21:00:00','%d,%b,%y %H:%i:%s'),4,'L105','R100');
insert into EventPlanLine values ('P102',3, str_to_date('5,DEC,18 19:00:00','%d,%b,%y %H:%i:%s'),str_to_date('5,DEC,18 22:00:00','%d,%b,%y %H:%i:%s'),2,'L103','R103');
insert into EventPlanLine values ('P103',1, str_to_date('12,DEC,18 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('12,DEC,18 21:00:00','%d,%b,%y %H:%i:%s'),2,'L103','R100');
insert into EventPlanLine values ('P103',2, str_to_date('12,DEC,18 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('12,DEC,18 21:00:00','%d,%b,%y %H:%i:%s'),4,'L105','R100');
insert into EventPlanLine values ('P103',3, str_to_date('12,DEC,18 19:00:00','%d,%b,%y %H:%i:%s'),str_to_date('12,DEC,18 22:00:00','%d,%b,%y %H:%i:%s'),2,'L103','R103');
insert into EventPlanLine values ('P104',1, str_to_date('26,OCT,18 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('26,OCT,18 22:00:00','%d,%b,%y %H:%i:%s'),4,'L101','R104');
insert into EventPlanLine values ('P104',2, str_to_date('26,OCT,18 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('26,OCT,18 22:00:00','%d,%b,%y %H:%i:%s'),4,'L100','R104');
insert into EventPlanLine values ('P105',1, str_to_date('25,OCT,18 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('25,OCT,18 22:00:00','%d,%b,%y %H:%i:%s'),4,'L101','R104');
insert into EventPlanLine values ('P105',2, str_to_date('25,OCT,18 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('25,OCT,18 22:00:00','%d,%b,%y %H:%i:%s'),4,'L100','R104');
insert into EventPlanLine values ('P199',1, str_to_date('10,DEC,18 8:00:00','%d,%b,%y %H:%i:%s'), str_to_date('10,DEC,18 12:00:00','%d,%b,%y %H:%i:%s'),1,'L100','R100');
insert into EventPlanLine values ('P349',1, str_to_date('12,DEC,18 12:00:00','%d,%b,%y %H:%i:%s'),str_to_date('12,DEC,18 15:30:00','%d,%b,%y %H:%i:%s'),1,'L103','R100');
insert into EventPlanLine values ('P85',1,  str_to_date('25,OCT,18 9:00:00','%d,%b,%y %H:%i:%s'), str_to_date('25,OCT,18 17:00:00','%d,%b,%y %H:%i:%s'),5,'L100','R100');
insert into EventPlanLine values ('P85',2,  str_to_date('25,OCT,18 8:00:00','%d,%b,%y %H:%i:%s'), str_to_date('25,OCT,18 17:00:00','%d,%b,%y %H:%i:%s'),2,'L102','R101');
insert into EventPlanLine values ('P85',3, str_to_date('25,OCT,18 10:00:00','%d,%b,%y %H:%i:%s'), str_to_date('25,OCT,18 15:00:00','%d,%b,%y %H:%i:%s'),3,'L104','R100');
insert into EventPlanLine values ('P95',1, str_to_date('26,OCT,18 8:00:00','%d,%b,%y %H:%i:%s'),  str_to_date('26,OCT,18 17:00:00','%d,%b,%y %H:%i:%s'),4,'L100','R100');
insert into EventPlanLine values ('P95',2, str_to_date('26,OCT,18 9:00:00','%d,%b,%y %H:%i:%s'),  str_to_date('26,OCT,18 17:00:00','%d,%b,%y %H:%i:%s'),4,'L102','R101');
insert into EventPlanLine values ('P95',3, str_to_date('26,OCT,18 10:00:00','%d,%b,%y %H:%i:%s'), str_to_date('26,OCT,18 15:00:00','%d,%b,%y %H:%i:%s'),4,'L106','R100');
insert into EventPlanLine values ('P95',4, str_to_date('26,OCT,18 13:00:00','%d,%b,%y %H:%i:%s'), str_to_date('26,OCT,18 17:00:00','%d,%b,%y %H:%i:%s'),2,'L100','R103');
insert into EventPlanLine values ('P95',5, str_to_date('26,OCT,18 13:00:00','%d,%b,%y %H:%i:%s'), str_to_date('26,OCT,18 17:00:00','%d,%b,%y %H:%i:%s'),2,'L101','R104');