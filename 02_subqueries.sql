use E_Learning

--(Subqueries)
--------------

-- Get the courses that have duration_hrs above the average duration of all courses
select * from Courses
where duration_hrs > (select avg(duration_hrs) from Courses)


-- Get the names of students who enrolled in at least one course
select first_name+' '+last_name as StudentName
from Students 
where student_id in (select student_id from Enrollments)
-- EXISTS version (more efficient on large data):
-- WHERE EXISTS (SELECT 1 FROM Enrollments WHERE student_id = s.student_id)


-- Get the names of students who reviewed a course taught by instructor 'Omar Khaled'
select first_name+' '+last_name as StudentName
from Students s inner join Reviews r
on s.student_id = r.student_id
where r.course_id in (
    select course_id from Courses c inner join Instructors i
    on c.instructor_id = i.instructor_id
    where i.instructor_id = (
        select instructor_id from Instructors
        where first_name = 'Omar' and last_name = 'Khaled'
    )
)


-- Get instructors who have no reviews on any of their courses
select I.*
from Instructors I inner join Courses C
on I.instructor_id = c.instructor_id
where course_id not in (select course_id from reviews)


-- Get each course title with its rating compared to the average rating of its category
-- Show only courses rated ABOVE their category average (Correlated Subquery)
select c.title, avg(r.rating) as avg_rating
from Courses c inner join Reviews r 
on c.course_id = r.course_id
group by c.course_id, c.title, c.category_id
having avg(r.rating) > (
    select avg(r2.rating)
    from Reviews r2
    inner join Courses c2 on r2.course_id = c2.course_id
    where c2.category_id = c.category_id  -- this is the correlation
)
