CREATE DATABASE TutorialDB;
USE TutorialDB;

--Schema--
CREATE TABLE Tutor (
    TutorKey INT NOT NULL,
    TutorLastName VARCHAR(255) NOT NULL,
    TutorFirstName VARCHAR(255) NOT NULL,
    TutorPhone VARCHAR(255) NOT NULL,
    TutorEmail VARCHAR(255),
    TutorHireDate DATE,
    TutorStatus VARCHAR(255),
    PRIMARY KEY (TutorKey)
);

CREATE TABLE Request (
    Requestkey INT NOT NULL,
    CourseKey INT NOT NULL,
    RequestDate DATE,
    RequestStatus VARCHAR(255),
    RequestStudentName VARCHAR(255),
    RequestStudentID VARCHAR(255),
    RequestStudentEmail VARCHAR(255),
    RequestNote VARCHAR(255),
    PRIMARY KEY (RequestKey),
    FOREIGN KEY (CourseKey) REFERENCES Course(CourseKey)
);

CREATE TABLE Course (
    CourseKey INT NOT NULL,
    CourseName VARCHAR(255) NOT NULL,
    CourseDescription VARCHAR(255),
    PRIMARY KEY (CourseKey)
);

CREATE TABLE Student (
    StudentKey INT NOT NULL,
    StudentLastName VARCHAR(255) NOT NULL,
    StudentFirstName VARCHAR(255) NOT NULL,
    StudentPhone VARCHAR(255) NOT NULL,
    StudentEmail VARCHAR(255),
    StudentGender VARCHAR(255),
    StudentAge INT,
    StudentCitizen VARCHAR(255),
    StudentWorkforceRetraining VARCHAR(255),
    EthnicityKey INT NOT NULL,
    PRIMARY KEY (StudentKey),
    FOREIGN KEY (EthnicityKey) REFERENCES Ethnicity(EthnicityKey)
);

CREATE TABLE TutorCourse (
    CourseKey INT NOT NULL,
    TutorKey INT NOT NULL,
    PRIMARY KEY (Coursekey, TutorKey),
    FOREIGN KEY (CourseKey) REFERENCES Course(CourseKey),
    FOREIGN KEY (TutorKey) REFERENCES Tutor(TutorKey)
);

CREATE TABLE StudentCourse (
    StudentKey INT NOT NULL,
    CourseKey INT NOT NULL,
    PRIMARY KEY (StudentKey, CourseKey),
    FOREIGN KEY (StudentKey) REFERENCES Student(StudentKey),
    FOREIGN KEY (CourseKey) REFERENCES Course(CourseKey)
);

CREATE TABLE Ethnicity (
    EthnicityKey INT NOT NULL,
    EthnicityDescription VARCHAR(255),
    PRIMARY KEY (EthnicityKey)
);

CREATE TABLE Session (
    SessionDateKey INT NOT NULL,
    SessionTimeKey TIME,
    TutorKey INT NOT NULL,
    CourseKey INT NOT NULL,
    StudentKey INT NOT NULL,
    StudentLastName VARCHAR(255),
    SessionStatus VARCHAR(255),
    SessionMaterialCovered VARCHAR(255),
    PRIMARY KEY (SessionDataKey, SessionTimeKey, TutorKey, CourseKey),
    FOREIGN KEY (TutorKey) REFERENCES Tutor(TutorKey),
    FOREIGN KEY (CourseKey) REFERENCES Course(CourseKey)
);