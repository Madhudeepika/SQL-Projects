CREATE TABLE Patients (
    PatientID INTEGER PRIMARY KEY,
    FirstName TEXT,
    LastName TEXT,
    Gender TEXT,
    DateOfBirth DATE
);


CREATE TABLE Doctors (
    DoctorID INTEGER PRIMARY KEY,
    FirstName TEXT,
    LastName TEXT,
    Specialization TEXT
);


CREATE TABLE Appointments (
    AppointmentID INTEGER PRIMARY KEY,
    PatientID INTEGER,
    DoctorID INTEGER,
    AppointmentDate DATE,
    Reason TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

CREATE TABLE Treatments (
    TreatmentID INTEGER PRIMARY KEY,
    AppointmentID INTEGER,
    TreatmentDescription TEXT,
    Cost DECIMAL,
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);


INSERT INTO Patients (FirstName, LastName, Gender, DateOfBirth) VALUES 
('John', 'Doe', 'Male', '1985-03-20'),
('Jane', 'Smith', 'Female', '1992-07-14'),
('Alice', 'Johnson', 'Female', '1988-11-30');


INSERT INTO Doctors (FirstName, LastName, Specialization) VALUES 
('Emily', 'Taylor', 'Cardiology'),
('Michael', 'Brown', 'Neurology'),
('Sarah', 'Wilson', 'Dermatology');

INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Reason) VALUES 
(1, 1, '2024-06-15', 'Regular Checkup'),
(2, 2, '2024-06-20', 'Headache'),
(3, 3, '2024-06-25', 'Skin Rash');

INSERT INTO Treatments (AppointmentID, TreatmentDescription, Cost) VALUES 
(1, 'General Checkup and Blood Test', 200.00),
(2, 'MRI Scan', 1500.00),
(3, 'Skin Allergy Test', 300.00);


SELECT * FROM Patients;
SELECT * FROM Doctors;
SELECT * FROM Appointments WHERE PatientID = 1;
SELECT * FROM Treatments WHERE AppointmentID = 2;


SELECT 
    P.FirstName, P.LastName, SUM(T.Cost) AS TotalCost
FROM 
    Patients P
JOIN 
    Appointments A ON P.PatientID = A.PatientID
JOIN 
    Treatments T ON A.AppointmentID = T.AppointmentID
GROUP BY 
    P.PatientID;
    
    
SELECT 
    D.FirstName, D.LastName, COUNT(A.AppointmentID) AS NumberOfAppointments
FROM 
    Doctors D
JOIN 
    Appointments A ON D.DoctorID = A.DoctorID
GROUP BY 
    D.DoctorID;
    
    
SELECT 
    D.Specialization, AVG(T.Cost) AS AverageTreatmentCost
FROM 
    Doctors D
JOIN 
    Appointments A ON D.DoctorID = A.DoctorID
JOIN 
    Treatments T ON A.AppointmentID = T.AppointmentID
GROUP BY 
    D.Specialization;
    
    
 





