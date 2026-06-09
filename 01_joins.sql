use E_Learning

--(Joins)
----------

--- Get each course title with its instructor's first and last name
select first_name +' '+ last_name as InstructorName, title
from instructors I inner join Courses C
on I.instructor_id = C.instructor_id

--- Get student name, course title, and enrollment status
select first_name +' '+ last_name as StudentName , status, title
from Students s inner join Enrollments e
on s.student_id = e.student_id
inner join
Courses c
on c.course_id = e.course_id

--- Get all students with their reviews (rating + comment), Show students who haven't written any reviews too
select s.* , rating, comment
from Students s left outer join Reviews r
on s.student_id = r.student_id

--- Get courses in the 'Databases' category along with the instructor name
select c.*, first_name+' '+last_name as InstructorName
from Courses c inner join Categories g
on g.category_id = c.category_id
inner join
Instructors I
on I.instructor_id = c.instructor_id
where g.category_name = 'Databases'

--- Get student name, course title, category name, and rating , Only for students who actually wrote a review
select first_name+' '+last_name as StudentName , c.title , g.category_name , r.rating
from Students s inner join Reviews r
on s.student_id = r.student_id
inner join
Courses c on c.course_id = r.course_id
inner join
Categories g on g.category_id = c.category_id
