CREATE TABLE Customer 
(
    CustNo VARCHAR(5) NOT NULL,
    CustName VARCHAR(25) NOT NULL,
    Address VARCHAR(20) NOT NULL,
    Internal CHAR(1) NOT NULL,
    Contact VARCHAR(20) NOT NULL,
    Phone VARCHAR(7) NOT NULL,
    City VARCHAR(15) NOT NULL,
    State CHAR(2) NOT NULL,
    ZIP VARCHAR(5) NOT NULL,
    PRIMARY KEY (CustNo)
);

CREATE TABLE Facility 
(
    FacNo VARCHAR(5) NOT NULL,
    FacName VARCHAR(20) NOT NULL,
    PRIMARY KEY (FacNo),
    UNIQUE(FacName)
);

CREATE TABLE Location 
(
    LocNo VARCHAR(5) NOT NULL,
    FacNo VARCHAR(5) NOT NULL,
    LocName VARCHAR(20) NOT NULL,
    PRIMARY KEY (LocNo),
    FOREIGN KEY (FacNo) REFERENCES Facility(FacNo)
);