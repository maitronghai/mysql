use testing_system;
-- Q1 --
select * from `account` a 
join `position` p on a.PositionID = p.PositionID
order by AccountID asc
;

-- Q2 --
select * from `account`
where CreatedDate > '2010.12.20';

-- Q3 --
select * from `account` a 
join `position` p on a.PositionID = p.PositionID
where PositionName like 'Dev%'
;

-- Q4 --
select d.DepartmentID,d.DepartmentName,count(a.AccountID) as totalMember
from `account` a
join department d on d.DepartmentID = a.DepartmentID
group by a.DepartmentID
having totalMember > 3 ;

-- Q5 --
select e.QuestionID, count(e.QuestionID) as Q
from `question` q 
join `examquestion` e on e.QuestionID = q.QuestionID
group by e.QuestionID
having Q = (select max(Q) from (select count(e.QuestionID) as Q
from `question` q 
join `examquestion` e on e.QuestionID = q.QuestionID
group by e.QuestionID ) as H )
;

-- Q6 --
select q.CategoryID, c.CategoryName  ,count(q.CategoryID) as I
from `question` q
join categoryquestion c on c.CategoryID = q.CategoryID
group by q.CategoryID
;

-- Q7 -- 
select q.*, count(q.questionid)
from `question` q 
join examquestion eq on q.questionid = eq.questionid
group by q.questionid
;

-- Q8 --
select a.QuestionID, count(a.QuestionID) as Q
from question q
join answer a on a.QuestionID = q.QuestionID
group by a.QuestionID
having Q=(select max(Q) from (select count(a.QuestionID) as Q
from question q
join answer a on a.QuestionID = q.QuestionID
group by a.QuestionID) as B )
;

-- Q9 --
select GroupID,count(AccountID) as `Member`
from groupaccount
group by GroupID
;

-- Q10 --
select p.PositionName ,count(a.PositionID) as totalMember
from `account` a
join `position` p on p.PositionID = a.PositionID
group by p.PositionID
having totalMember <= 1;

select p.PositionName ,count(a.PositionID) as totalMember
from `account` a
join `position` p on p.PositionID = a.PositionID
group by p.PositionID
having totalMember = (select min(total) from (select count(a.PositionID) as total
from `account` a
join `position` p on p.PositionID = a.PositionID
group by p.PositionID) as T)
;

-- Q11 -- ??? 
select  *
from `account` a 
join `position` p on p.PositionID = a.PositionID
where a.departmentid = 1 and a.positionid=1;

-- Q12 --
select * from `question` q 
join typequestion t on t.TypeID = q.TypeID
join answer a on a.QuestionID = q.QuestionID
;

-- Q13 --
select q.TypeID,t.TypeName ,count(q.TypeID) as sl
from question q 
join typequestion t on t.TypeID = q.TypeID
group by q.TypeID;

-- Q14,15 --
select *
from `group` g 
left join groupaccount ga on ga.groupid = g.groupid
where AccountID is null;

-- Q16 --
select *
from question q 
left join answer a on a.questionid = q.questionid
where AnswerID is null;

-- Q18 --
select GroupID ,count(GroupID) as `member`
from groupaccount
group by GroupID
having `member` >= 5 
union
select GroupID ,count(GroupID) as `member`
from groupaccount
group by GroupID
having `member` <= 7 ;




