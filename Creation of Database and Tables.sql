-- Creation of DATABASE
Create Database loan_portfolio_analysis;
-- Using the DATABASE 
Use database loan_portfolio_analysis;
-- Creating the SCHEMA
create schema loan_data;
-- Using the SCHEMA     
use schema loan_data;

-- Creation of Clients Table
Create or replace table clients (
    client_id varchar(50) Primary Key,
    client_name varchar(100),
    client_score integer,
    income_bracket varchar(50),
    employment_status varchar(50),
    state varchar(50),
    registration_date date 
);

-- Creation of Loans Table
Create or replace Table loans (
    loan_id varchar(50) primary key,
    client_id varchar(50),
    principal_amount decimal (15,2),
    interest_rate decimal (5,3),
    start_date date,
    end_date date,
    term_month integer,
    loan_type varchar(50),
    status varchar (20),
-- Foreign Key Constrains (Giving foreing key connection)
    CONSTRAINT fk_loans_client FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

-- Creating the payments Table

Create or replace Table payments (
    payment_id varchar(50) primary key,
    loan_id varchar(50),
    payment_date date,
    amount_due decimal (10,2),
    amount_paid decimal (10,2),
    payment_status varchar (20),
    due_date date,
-- Connecting the foreing key 
     CONSTRAINT fk_payments_loan FOREIGN KEY (loan_id) REFERENCES loans (loan_id)
);

-- Creating the default Table
Create or replace Table default (
    default_id varchar(50),
    loan_id varchar(50),
    default_date date,
    amount_outstanding decimal (15,2),
    default_reason varchar(100),
-- Connecting the foreing key
    CONSTRAINT fk_defaults_loan FOREIGN KEY (loan_id) REFERENCES loans(loan_id)
);

-- Altering the loan table changing the datatype to DATE
ALTER TABLE loans 
MODIFY COLUMN end_date DATE;
select * from clients;
select * from loans;
select * from payments;
select * from default;

-- Show all databases you can access
SHOW DATABASES;

-- Show all schemas in current database
SHOW SCHEMAS;

-- Show current database and schema you're working in
SELECT CURRENT_DATABASE(), CURRENT_SCHEMA();

-- Checking all the tables which is created
show tables;

-- Checking all the uploaded data in the table
select * from clients;
select * from loans;
select * from payments;
select * from default;