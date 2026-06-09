use E_Learning

--(Aggregate Functions)
-- note: we can group by instructor_id in Q3, Q6 in case of similar names
-- => group by instructor_id, first_name, last_name
--------------

-- Get the total number of courses in each category, Show category name and course count
select count(course_id) as numOfCourses, category_name
from Courses c inner join Categories g
on c.category_id = g.category_id
group by category_name

-- Get the average rating for each course, Show course title and average rating
select avg(rating) as AvgRating, c.title
from Reviews r inner join Courses c
on c.course_id = r.course_id
group by c.title

-- Get instructors who teach more than one course, Show instructor name and number of courses, ordered descending
select count(course_id) as numOfCoursesTeach, first_name+' '+last_name as InstructorName
from Instructors i inner join Courses c
on i.instructor_id = c.instructor_id
group by first_name+' '+last_name 
having count(i.instructor_id) > 1

-- Get courses that have more than 2 reviews, Show course title and review count
select count(*), c.title
from Courses c inner join Reviews r
on c.course_id = r.course_id
group by c.title
having count(*) > 2

-- Get the highest and lowest salary among instructors, Also show the difference between them
select max(salary) as highest , min(salary) as lowest, max(salary)-min(salary) as Difference
from Instructors

-- Get each instructor's total teaching hours (sum of duration_hrs of their courses)
-- Show only instructors with more than 40 total hours, Order by total hours descending
select sum(duration_hrs) as totalHours, i.first_name+' '+i.last_name as InstructorName
from Instructors i inner join Courses c
on i.instructor_id = c.instructor_id
group by i.first_name+' '+i.last_name
having sum(duration_hrs) > 40
order by totalHours desc
