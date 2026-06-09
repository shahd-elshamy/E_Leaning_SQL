use E_Learning

--DDL:

create table Categories (
    category_id   int primary key identity(1,1),
    category_name varchar(100) not null unique,
    description   varchar(300)
)

create table Instructors (
    instructor_id int primary key identity(1,1),
    first_name varchar(20) not null,
    last_name varchar(20)  not null,
    email varchar(50) not null unique check (email like '%@%.%'),
    hire_date date default getdate(),
    salary int check (salary >= 0)
)

create table Courses (
    course_id int primary key identity(1,1),
    title varchar(100) not null,
    duration_hrs int not null check (duration_hrs > 0),
    category_id int not null,
    instructor_id int not null,
    constraint fk_cc foreign key (category_id) references categories(category_id),
    constraint fk_ci foreign key (instructor_id) references instructors(instructor_id)
)

create table Students (
    student_id int primary key identity(1,1),
    first_name varchar(50)  not null,
    last_name  varchar(50)  not null,
    email varchar(100) not null unique check (email like '%@%.%'),
    phone varchar(20),
    birth_date date,
    address varchar(60) default 'Cairo'
)

-- Composite PK: a student can enroll in a course only once
create table Enrollments (
    status varchar(20) not null default 'Active' check (status in ('Active','Completed','Dropped')),
    enrolled_at datetime default getdate(),
    student_id int not null,
    course_id int not null,
    constraint pk_enrollment primary key (student_id, course_id),
    constraint fk_es foreign key (student_id) references students(student_id) on delete cascade,
    constraint fk_ec foreign key (course_id)  references courses(course_id) on delete cascade
)

-- Composite PK: a student can review a course only once
create table Reviews (
    rating tinyint not null check (rating between 1 and 5),
    comment varchar(500),
    reviewed_at datetime default getdate(),
    student_id int not null,
    course_id int not null,
    constraint pk_review primary key (student_id, course_id),
    constraint fk_rs foreign key (student_id) references students(student_id) on delete cascade,
    constraint fk_rc  foreign key (course_id) references courses(course_id) on delete cascade
)
