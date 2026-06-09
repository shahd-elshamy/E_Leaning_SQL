# E-Learning Database — SQL Practice Project

A relational database project for an online learning platform, built to practice and demonstrate core SQL skills.

---

## Database Overview

The database simulates an e-learning system with the following tables:

| Table | Description |
|---|---|
| `categories` | Course categories (e.g. Programming, Data Science) |
| `instructors` | Instructor profiles and salary info |
| `courses` | Course catalog linked to categories and instructors |
| `students` | Student profiles |
| `enrollments` | Student-course enrollments (composite PK) |
| `reviews` | Student reviews and ratings per course (composite PK) |

### Entity Relationship
- A **course** belongs to one **category** and is taught by one **instructor**
- A **student** can enroll in many **courses** — a **course** can have many **students** (M:N → `enrollments`)
- A **student** can review many **courses** — a **course** can have many **reviews** (M:N → `reviews`)

---

## SQL Concepts Covered

### 1. Joins
- INNER JOIN across 2, 3, and 4 tables
- LEFT OUTER JOIN
- Filtering with WHERE vs ON

### 2. Subqueries
- Scalar subqueries
- Subqueries with IN / NOT IN
- Correlated subqueries (HAVING with inner reference)
- Nested subqueries

### 3. Aggregate Functions
- COUNT, AVG, SUM, MAX, MIN
- GROUP BY with multiple columns
- HAVING for group-level filtering

### 4. Ranking / Window Functions
- RANK(), DENSE_RANK(), ROW_NUMBER()
- PARTITION BY for per-group ranking
- Subquery pattern for aggregated window functions

---

## Design Decisions
- Constraints include CHECK, UNIQUE, DEFAULT, and ON DELETE CASCADE where appropriate

## Tools Used

- **SQL Server** (T-SQL)
- **SQL Server Management Studio (SSMS)**

---

## Project Structure

```
E_Learning_SQL/
│
├── schema.sql            -- CREATE TABLE statements (DDL)
├── insert_data.sql       -- Sample data (DML)
├── README.md
└── queries/
    ├── 01_joins.sql
    ├── 02_subqueries.sql
    ├── 03_aggregate_functions.sql
    └── 04_ranking_functions.sql
```
