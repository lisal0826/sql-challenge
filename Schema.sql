-- Create the departments table
CREATE TABLE departments (
    dept_no VARCHAR(4) PRIMARY KEY,
    dept_name VARCHAR(40) NOT NULL
);

-- Create the titles table
CREATE TABLE titles (
    title_id VARCHAR(5) PRIMARY KEY,
    title VARCHAR(50) NOT NULL
);

-- Create the employees table with a foreign key that references titles(title_id)
CREATE TABLE employees (
    emp_no SERIAL PRIMARY KEY,
    emp_title_id VARCHAR(5) NOT NULL,
    birth_date DATE,
    first_name CHARACTER VARYING(50),
    last_name CHARACTER VARYING(50),
    sex CHARACTER VARYING(10),
    hire_date DATE,
    CONSTRAINT fk_emp_title FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- Create the salaries table with a foreign key that references employees(emp_no)
CREATE TABLE salaries (
    emp_no INT,
    salary FLOAT,
    PRIMARY KEY (emp_no, salary),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create the dept_emp table to link employees and departments with foreign keys
CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR(4),
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Create the dept_manager table to define department managers
CREATE TABLE dept_manager (
    dept_no VARCHAR(4),
    emp_no INT,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

