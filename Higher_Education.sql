CREATE DATABASE Higher_Education;
USE Higher_Education;

CREATE TABLE Maps(
    Location_ID INT PRIMARY KEY,
    Location_Name VARCHAR(100)    
);

CREATE TABLE University(
    University_ID INT PRIMARY KEY,
    University_Name VARCHAR(70),
    Location_ID INT,
    FOREIGN KEY (Location_ID) REFERENCES Maps(Location_ID)
);

CREATE TABLE Class(
    Class_ID INT PRIMARY KEY,
    Class_Name VARCHAR(50)
);

CREATE TABLE Lecturer(
    Lecturer_ID INT PRIMARY KEY,
    Gender VARCHAR(10),
    Lecturer_DOB DATE,
    street VARCHAR(20),
    postal_code VARCHAR(10),
    city VARCHAR(10),
    First_Name VARCHAR(10),
    Last_Name VARCHAR(10),
    University_ID INT,
    FOREIGN KEY (University_ID) REFERENCES University(University_ID)
);

CREATE TABLE Course(
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(50),
    Class_ID INT,
    University_ID INT,
    FOREIGN KEY (University_ID) REFERENCES University(University_ID),
    FOREIGN KEY (Class_ID) REFERENCES Class(Class_ID)
);

CREATE TABLE Works_On(
    Lecturer_ID INT,
    Course_ID INT,
    Work_Hours INT,
    PRIMARY KEY (Lecturer_ID, Course_ID),
    FOREIGN KEY (Lecturer_ID) REFERENCES Lecturer(Lecturer_ID),
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);