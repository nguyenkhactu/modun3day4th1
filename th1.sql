create database quanlysinhvien2;
use quanlysinhvien2;
create table class(
classid int not null primary key auto_increment,
classname varchar (60) not null,
StartDate datetime not null,
Status bit );

select * from class;

insert into class (ClassName,StartDate,Status)
value ('a1','2008-12-20',1),
	  ('a2','2008-12-22',1),
      ('b3',Current_Date(),0);

create table Student(
StudentID int not null primary key auto_increment,
StudentName varchar (30) not null,
Address varchar (30),
Phone varchar (20),
Status bit,
ClassID int not null);

select * from Student;

insert into Student(StudentName,Address,Phone,Status,ClassID)
value ('Hung','Ha noi','0912113113',1,1),
      ('Hoa','Hai phong',null,1,1),
      ('Manh','HCM','0123123123',0,2);
      
      create table Subject(
      SubID int not null primary key auto_increment,
      SubName varchar (30) not null,
      Credit tinyint NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
      Status  BIT                  DEFAULT 1);
      
    INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
       CREATE TABLE Mark
(
    MarkId    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubId     INT NOT NULL,
    StudentId INT NOT NULL,
    Mark      FLOAT   DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
    ExamTimes TINYINT DEFAULT 1,
    UNIQUE (SubId, StudentId),
    FOREIGN KEY (SubId) REFERENCES Subject (SubId),
    FOREIGN KEY (StudentId) REFERENCES Student (StudentId)
);
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
       select * from class;
       select * from mark;
       select * from student;
       select * from subject;
       
select student.Address,count(StudentId) as ' so luong hoc vien' from student
group by student.Address;

SELECT S.StudentId,S.StudentName, AVG(Mark)
FROM Student S join Mark M on S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName;

SELECT S.StudentId,S.StudentName, AVG(Mark)
FROM Student S join Mark M on S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
HAVING AVG(Mark) > 3;

SELECT S.StudentId, S.StudentName, AVG(Mark)
FROM Student S join Mark M on S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
HAVING AVG(Mark) >= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.StudentId);