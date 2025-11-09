use project;
select * from departments;
insert into departments value('5005','mathematic');
select * from student;
alter table student add constraint departments foreign key(departmentid) references student(departmentid);s