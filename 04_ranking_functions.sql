use E_Learning

--(Ranking functions)
----------------------

-- Rank all courses by duration_hrs from longest to shortest . Show course title, duration, and rank
select title, duration_hrs, Rank() over (order by duration_hrs desc) as Rnk
from Courses

-- Rank instructors by their salary . Show instructor name, salary, and dense rank
select first_name+' '+last_name as InstructorName, salary, Dense_Rank() over (order by salary) as DR
from Instructors

-- Assign a row number to each student's enrollment
-- ordered by enrolled_at
-- Show student name, course title, enrolled_at, and row number
select first_name+' '+last_name as StudentName , title, enrolled_at, Row_Number() over (order by enrolled_at) as RN
from Students s inner join Enrollments e
on s.student_id = e.student_id
inner join
Courses c on c.course_id = e.course_id

-- Rank courses within each category by their average rating
-- Show category name, course title, average rating, and rank
select category_name, title, avg_rating,
       rank() over (partition by category_id order by avg_rating desc) as rnk
from (
    select g.category_id,
           g.category_name,
           c.title,
           avg(r.rating) as avg_rating
    from categories g
    inner join courses c
        on g.category_id = c.category_id
    inner join reviews r
        on c.course_id = r.course_id
    group by g.category_id,
             g.category_name,
             c.course_id,
             c.title
) as ranked
